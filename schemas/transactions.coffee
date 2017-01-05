exports.get = (mongoose)->  
  Transactions = new mongoose.Schema
    owner:
      type: String
    sum:
      type: Number
      required: true
    card_number:
      type: Number
      required: true
    created_at:
      type: Date
      required: true
    mega:
      type: Number
      required: true
    is_ikea:
      type: Boolean
      default: false
    whos:
      type: String
      required: true
      default: "admin"

  return mongoose.model('Transactions', Transactions)