easyimg = require 'easyimage'
path    = require 'path'

exports.init = (app, upload)->
  app.post "/api/upload_image", upload.single("document"), (req, res, next)->
    if req.file isnt undefined
      console.log req.file
      easyimg.info(path.join(__dirname, '../', '/dist/uploaded_images/' + req.file.filename)).then (file)->
        resize_to =
          src: path.join(__dirname, '../', '/dist/uploaded_images/' + req.file.filename)
          dst: path.join(__dirname, '../', '/dist/uploaded_images/' + req.file.filename)
          width: file.width
          height: file.height
        if (file.width > file.height) and (file.width > 500)
          resize_to.width = 500
          resize_to.height = Math.round file.height*500/file.width
        if (file.height > file.width) and (file.height > 500)
          resize_to.height = 500
          resize_to.width = Math.round file.width*500/file.height

        easyimg.resize resize_to
        res.send {src: req.file.filename}
    else
      res.send 500
    