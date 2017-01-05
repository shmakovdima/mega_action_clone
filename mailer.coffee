config     = require './config.json'
nodemailer = require 'nodemailer'

exports.sendNoReply = (email, template, cb)->
  transporter = nodemailer.createTransport config.nodemailer['no-reply']
  mailOptions = 
    from: config.nodemailer['no-reply'].auth.user
    to: email
    subject: "Меняйтесь с нами!"
    text: "Меняйтесь с нами!"
    html: template
  transporter.sendMail mailOptions, (err, info)->
    cb err

exports.sendSupport = (from, name, template, cb)->
  transporter = nodemailer.createTransport config.nodemailer['support']
  mailOptions = 
    from: config.nodemailer['support'].auth.user
    to: config.nodemailer['support'].mail
    # to: "n.koroffin@gmail.com"
    subject: "Обращение в службу поддержки от " + name
    text: from + "<br />" + template
    html: from + "<br />" + template
  transporter.sendMail mailOptions, (err, info)->
    console.log err
    cb err  

exports.sendResult = (email, template, cb)->
  transporter = nodemailer.createTransport config.nodemailer['no-reply']
  mailOptions = 
    from: config.nodemailer['no-reply'].auth.user
    to: email
    subject: "Новости проекта «Меняйся» от МЕГИ"
    text: "Новости проекта «Меняйся» от МЕГИ"
    html: template
  transporter.sendMail mailOptions, (err, info)->
    cb err

exports.sendCustomMail = (obj, cb)->
  transporter = nodemailer.createTransport config.nodemailer['no-reply']
  mailOptions = 
    from: config.nodemailer['no-reply'].auth.user
    to: obj.to
    subject: obj.subject
    text: "Новости проекта «Меняйся» от МЕГИ"
    html: obj.template
  transporter.sendMail mailOptions, (err, info)->
    cb err  


