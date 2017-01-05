exports.get = (mongoose)->

  PhotosOwner = new mongoose.Schema
    fname:
      type: String
      required: true
    lname:
      type: String
      required: true

  Photos = new mongoose.Schema
    src:
      type: String
      required: true
    created_at:
      type: Date
      required: true
    updated_at:
      type: Date
    status:
      type: String
      required: true
    comment:
      type: String
    comment_by:
      type: String
    isPretty:
      type: Boolean
    mayWin:
      type: Boolean
    mega:
      type: Number
    owner:
      type: PhotosOwner
    is_shared:
      type: Boolean
      default: false
    is_winner:
      type: Boolean
      default: false

  Photos.methods.getStatus = (status)->
    s = parseInt status, 10
    console.log s
    res = switch
      when s is 0 then "Удалённая"
      when s is 1 then "Новая"
      when s is 2 then "Ожидает одобрения"
      when s is 3 then "Одобренная"


  return mongoose.model('Photos', Photos)
