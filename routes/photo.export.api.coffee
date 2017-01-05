path   = require "path"
moment = require "moment"
fs     = require "fs"
excel  = require 'msexcel-builder'

exports.init = (app, model, preregisters, imager, mailer)->

  app.get "/api/photo/csv", (req, res, next)->
    ts = new Date().valueOf()
    file_name = path.join(__dirname, '../', '/dist/csv/export_result_photo_' + ts + '.xls')

    res.send {name: 'export_result_photo_' + ts + '.xls'}  
    
    model.find({status: 3}).sort({'created_at': -1}).exec (err, records)->
      preregisters.find {looks: {$exists: true, $ne: []}}, (err, preregisters)->
        workbook = excel.createWorkbook(path.join(__dirname, '../', '/dist/csv/'), 'export_result_photo_' + ts + '.xls')
        sheet1 = workbook.createSheet('sheet1', 12, 100000)
        
        sheet1.set 1, 1, 'ID'
        sheet1.set 2, 1, 'Фотография'
        sheet1.set 3, 1, 'Рекомедация на победителя'
        sheet1.set 4, 1, 'Телефон'
        sheet1.set 5, 1, 'E-mail'
        sheet1.set 6, 1, 'Дата'
        sheet1.set 7, 1, 'Фамилия'
        sheet1.set 8, 1, 'Имя'
        sheet1.set 9, 1, 'Статус'
        sheet1.set 10, 1, 'Расшареное фото'
        sheet1.set 11, 1, 'Комментарий эксперта'
        sheet1.set 12, 1, 'Оценка эксперта'

        str = 2
        for record in records
          if record.owner isnt undefined
            for p in preregisters
              if p.looks.indexOf(record._id+"") isnt -1
                
                sheet1.set 1, str, record._id
                sheet1.set 2, str, "http://change.megamall.ru/static/uploaded_images/" + record.src
                sheet1.set 3, str, !!record.mayWin
                sheet1.set 4, str, p.phone
                sheet1.set 5, str, if p.email is undefined then "" else p.email
                sheet1.set 6, str, moment(record.created_at).format("DD.MM.YY HH:mm:ss")
                sheet1.set 7, str, record.owner.fname
                sheet1.set 8, str, record.owner.lname 
                sheet1.set 9, str, record.getStatus(record.status)
                sheet1.set 10, str, record.is_shared
                sheet1.set 11, str, record.comment.replace(/\)/gi, "")
                sheet1.set 12, str, if record.isPretty then "Оставить" else "Отдать"

                str = str+1

        workbook.save ()->
          console.log "ok"

  app.get "/api/photo/csv2", (req, res, next)->
    ts = new Date().valueOf()
    file_name = path.join(__dirname, '../', '/dist/csv/export_photo_' + ts + '.xls')

    res.send {name: 'export_photo_' + ts + '.xls'}  

    model.find({status: 3}).sort({'created_at': -1}).exec (err, records)->
      preregisters.find {looks: {$exists: true, $ne: []}}, (err, preregisters)->
        workbook = excel.createWorkbook(path.join(__dirname, '../', '/dist/csv/'), 'export_photo_' + ts + '.xls')
        sheet1 = workbook.createSheet('sheet1', 8, 100000)
        
        sheet1.set 1, 1, 'Имя'
        sheet1.set 2, 1, 'Фамилия'
        sheet1.set 3, 1, 'Телефон'
        sheet1.set 4, 1, 'E-mail'
        sheet1.set 5, 1, 'Фото'
        sheet1.set 6, 1, 'Рекомедация к победителю'
        sheet1.set 7, 1, 'Дата загрузки'
        sheet1.set 8, 1, 'Дата модерации'

        str = 2
        for record in records
          if record.owner isnt undefined
            for p in preregisters
              if p.looks.indexOf(record._id+"") isnt -1                  
                sheet1.set 1, str, record.owner.fname
                sheet1.set 2, str, record.owner.lname
                sheet1.set 3, str, p.phone
                sheet1.set 4, str, if p.email isnt undefined then p.email else ""
                sheet1.set 5, str, "http://change.megamall.ru/static/uploaded_images/" + record.src
                sheet1.set 6, str, !!record.mayWin
                sheet1.set 7, str, moment(record.created_at).format("DD.MM.YY HH:mm:ss")
                sheet1.set 8, str, if !record.updated_at then "" else moment(record.updated_at).format("DD.MM.YY HH:mm:ss")

                str = str+1
                
        workbook.save ()->
          console.log "ok"