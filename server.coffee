express      = require 'express'
session      = require 'express-session'
YAML         = require 'yamljs'
multer       = require 'multer'
body_parser  = require 'body-parser'
mongoose     = require 'mongoose'
cp           = require 'child_process'
geoip        = require 'geoip'
mime         = require 'mime'
cors         = require 'cors'

mailer       = require "./mailer.coffee"
sms          = require "./sms.coffee"
images       = require "./images.coffee"

config       = require "./config.json"

City         = new geoip.City "./GeoLiteCity.dat"

app = express()

images.init()

# database connection
mongoose.connect config.db.path + config.db.name
db = mongoose.connection

db.on 'error', (err)->
  console.log "Error connection to database: ", err
  mongoose.disconnect()
db.once 'open', ()->
  console.log "Connected to db!"
db.on 'reconnected', ()->
  console.log 'MongoDB reconnected!'
db.on 'disconnected', ()->
  console.log('MongoDB disconnected!')
  setTimeout ()->
    cp.exec "service mongod start", (err, stdout)->
      console.log err if err
      mongoose.connect config.db.path + config.db.name
  , 500


# Schemas loading
WeightModel       = require('./schemas/weight.coffee').get mongoose
WeightGraphModel  = require('./schemas/weight.graph.coffee').get mongoose
TransactionsModel = require('./schemas/transactions.coffee').get mongoose
PreRegisterModel  = require('./schemas/preregister.coffee').get mongoose
UsersModel        = require('./schemas/users.coffee').get mongoose
PhotosModel       = require('./schemas/photos.coffee').get mongoose
CardModel         = require('./schemas/cards.coffee').get mongoose
DashboardModel    = require('./schemas/dashboard.coffee').get mongoose

# upload
upload = multer
  fileFilter: (req, file, cb)->
    arr = file.originalname.split '.'
    extension = arr[arr.length-1].toLowerCase()
    cb null, (extension is "png") or (extension is "jpg") or (extension is "jpeg")
  storage: multer.diskStorage
    destination: (req, file, cb)->
      cb null, "./dist/uploaded_images/"
    filename: (req, file, cb)->
      arr = file.originalname.split '.'
      extension = arr[arr.length-1]
      cb null, file.fieldname + '-' + Date.now() + '.' + extension

# jade config
app.set "views", "src/views"
app.set 'view engine', 'jade'

# session
app.use session config.session

# static

app.use "/static/fonts/*", (req, res, next)->
  arr = req.originalUrl.split "."
  ext = if arr.length isnt 0 then arr[arr.length-1] else "html"
  res.header "Content-Type", mime.lookup(ext)
  res.header "Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS"
  res.header "Access-Control-Allow-Headers", "Content-Type"
  next()

app.use "/static/fonts/*", cors()

app.use "/static", express.static("dist")

# set locale pack
language_packages = {}
for lang in config.languages 
  language_packages[lang] = YAML.load "src/language/" + lang + "/main.yml"

app.use (req, res, next)->
  res.locals.config = config.jade
  res.locals.basedir = app.get('views')

  res.locals.City = City.lookupSync req.headers['x-forwarded-for'] || req.connection.remoteAddress
  res.locals.city_string = JSON.stringify res.locals.City

  lang = req.session.lang || "russian"
  res.locals.language = language_packages[lang]
  res.locals.language_string = JSON.stringify language_packages[lang]

  next()

# bodyparser for json
app.use body_parser.json({ type: 'application/json' })

# middlewares
app.set "isAdminMiddleware", (req, res, next)->
  if (req.session.category is 2) then next() else res.redirect("/admin")
app.set "isPromouterMiddleware", (req, res, next)->
  if (req.session.category is 1) then next() else res.redirect("/admin")
app.set "isExpertMiddleware", (req, res, next)->
  if (req.session.category is 3) then next() else res.redirect("/admin")
app.set "isModeratorMiddleware", (req, res, next)->
  if (req.session.category is 4) then next() else res.redirect("/admin")

# routes
require("./routes/preregister.api.coffee").init(app, PreRegisterModel, mailer, PhotosModel, CardModel, WeightModel, TransactionsModel, sms)
require("./routes/callback.coffee").init(app, mailer)
require("./routes/users.api.coffee").init(app, UsersModel)
require("./routes/photo.api.coffee").init(app, PhotosModel, PreRegisterModel, images, mailer)
require("./routes/config.api.coffee").init(app)
require("./routes/upload.api.coffee").init(app, upload)
require("./routes/weight.graph.api.coffee").init(app, WeightGraphModel, WeightModel)
require("./routes/dashboard.api.coffee").init(app, DashboardModel, PreRegisterModel, PhotosModel, TransactionsModel, WeightModel)
require("./routes/static.coffee").init(app) 

app.listen config.port, ()->
  console.log 'App listening on port 3000!'