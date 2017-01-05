exports.get = (mongoose)->
  
  Weight = new mongoose.Schema
    owner:
      type: String
    weight:
      type: Number
      required: true
    created_at:
      type: Date
      required: true
    mega:
      type: Number
      required: true
    whos:
      type: String
      required: true
      default: "admin"

  return mongoose.model('Weight', Weight)