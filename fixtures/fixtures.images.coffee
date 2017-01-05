easyimg = require 'easyimage'
fs      = require 'fs'
async   = require 'async'

resizeImage = (f, cb)->
  easyimg.info("dist/uploaded_images/" + f).then (file)->
    resize_to =
      src: 'dist/uploaded_images/' + f
      dst: 'dist/uploaded_images/' + f
      width: file.width
      height: file.height
    if (file.width > file.height) and (file.width > 500)
      resize_to.width = 500
      resize_to.height = Math.round file.height*500/file.width
    if (file.height > file.width) and (file.height > 500)
      resize_to.height = 500
      resize_to.width = Math.round file.width*500/file.height  

    easyimg.resize(resize_to).then ()->
      console.log "here"
      async.setImmediate cb

getHandler = (f, i, l)->
  ()->
    resizeImage(f, i, l)

fs.readdir "dist/uploaded_images/", (err, files)->
  async.eachSeries files, (file, cb)->
    resizeImage(file, cb)
  , ()->
    console.log "That's all! " + files.length

