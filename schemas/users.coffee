exports.get = (mongoose)->

  Users = new mongoose.Schema
    login:
      type: String
      required: true
      unique : true
    password:
      type: String
      required: true
    salt:
      type: String
      required: true
    category:
      type: Number
      required: true
    mega:
      type: Number
    comment:
      type: String

  return mongoose.model('Users', Users)
