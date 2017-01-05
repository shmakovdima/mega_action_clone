exports.get = (mongoose)->
  
  WeightGraph = new mongoose.Schema
    day:
      type: String
    weight:
      type: Number

  return mongoose.model('WeightGraph', WeightGraph)