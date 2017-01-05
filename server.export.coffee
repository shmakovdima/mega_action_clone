express      = require 'express'
body_parser  = require 'body-parser'
mongoose     = require 'mongoose'

config       = require "./config.json"

app = express()

# database connection
mongoose.connect(config.db.path + config.db.name)
db = mongoose.connection

db.on 'error', (err)->
  console.log "Error connection to database: ", err
db.once 'open', ()->
  console.log "Connected to db!"

# Schemas loading
WeightModel       = require('./schemas/weight.coffee').get mongoose
TransactionsModel = require('./schemas/transactions.coffee').get mongoose
PreRegisterModel  = require('./schemas/preregister.coffee').get mongoose
UsersModel        = require('./schemas/users.coffee').get mongoose
PhotosModel       = require('./schemas/photos.coffee').get mongoose
CardModel         = require('./schemas/cards.coffee').get mongoose
DashboardModel    = require('./schemas/dashboard.coffee').get mongoose

# bodyparser for json
app.use body_parser.json({ type: 'application/json' })


# routes
require("./routes/preregister.export.api.coffee").init(app, PreRegisterModel, null, PhotosModel, CardModel, WeightModel, TransactionsModel, null)
require("./routes/photo.export.api.coffee").init(app, PhotosModel, PreRegisterModel, null, null)

app.listen 5000, ()->
  console.log 'App listening on port 3000!'