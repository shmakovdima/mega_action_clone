config     = require './config.json'
Canvas     = require 'canvas'
Image      = Canvas.Image
Font       = Canvas.Font
fs         = require "fs"

yes_label  = null
no_label   = null
black_line = null
quest      = null
mega       = null

Playfair   = new Font('Playfair', __dirname + "/share/PlayfairDisplay-Regular.ttf")
Playfair.addFace(__dirname + "/share/PlayfairDisplay-Regular.ttf",   'bold')

wrapText = (ctx, text, mL, mT)->
  words = text.split(" ");
  countWords = words.length;
  line = "";
  for word in words 
    testLine = line + word + " ";
    testWidth = ctx.measureText(testLine).width;
    if (testWidth > 637) 
      ctx.fillText(line, mL, mT);
      line = word + " ";
      mT += 40;
    else 
      line = testLine
  ctx.fillText(line, mL, mT);


exports.init = (cb)->
  fs.readFile __dirname + "/share/res_ok.png", (err, squid)->
    yes_label = new Image
    yes_label.src = squid

  fs.readFile __dirname + "/share/res_no.png", (err, squid)->
    no_label = new Image
    no_label.src = squid

  fs.readFile __dirname + "/share/line.png", (err, squid)->
    black_line = new Image
    black_line.src = squid

  fs.readFile __dirname + "/share/logo_mega.png", (err, squid)->
    mega = new Image
    mega.src = squid

  fs.readFile __dirname + "/share/get_png.png", (err, squid)->
    quest = new Image
    quest.src = squid

    cb() if typeof cb is "function"


exports.processPic = (photo, res)->
  fs.readFile __dirname + "/dist/uploaded_images/" + photo.src, (err, squid)->
    throw err if err 

    img = new Image
    img.src = squid

    canvas = new Canvas 1200, 630
    ctx = canvas.getContext "2d"

    k = 630 / img.height

    img_x = if img.width*k < 450 then 0 else Math.round((450-img.width*k)/2)

    ctx.drawImage img, img_x, 0, img.width*k, 630

    ctx.fillStyle = "#d8646f"
    ctx.fillRect 1118, 0, 82, 630

    ctx.fillStyle = "#ffffff"
    ctx.fillRect 450, 0, 648, 630

    ctx.drawImage (if photo.isPretty then yes_label else no_label), 0, 498, 294, 72
    ctx.drawImage quest, 481, 498, 363, 82
    ctx.drawImage mega, 948, 520, 142, 40
    ctx.drawImage black_line, 481, 79, 140, 3

    ctx.addFont Playfair
    ctx.font = 'bold 40px Playfair'
    ctx.fillStyle = "#000000"
    # ctx.fillText(photo.comment,481, 159)
    wrapText ctx, photo.comment, 481, 159

    stream = canvas.createPNGStream()

    res.set
      "Content-Type": "image/png"

    stream.on 'data', (chunk)->
      res.write(chunk)

    stream.on 'end', ()->
      res.end()