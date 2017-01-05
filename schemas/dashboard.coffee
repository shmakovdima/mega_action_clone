exports.get = (mongoose)->

  Dashboard = new mongoose.Schema
    created_at:
      type: String
      required: true
    members_count:
      type: Number
      required: true
    total_weight:
      type: Number
      required: true
    photos_count:
      type: Number
      required: true
    money_paid:
      type: Number
      required: true

  return mongoose.model('Dashboard', Dashboard)
