exports.get = (mongoose)->

  Cards = new mongoose.Schema
    number:
      type: Number
      required: true
      unique: true
    owner:
      type: Number
      required: true
    is_active:
      type: Boolean
      required: true
      default: true
    recipient:
      type: String

  return mongoose.model('Cards', Cards)
