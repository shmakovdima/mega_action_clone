var changed_u = 0
db.transactions.find({whos: "mega_nn", created_at: {$gte: ISODate("2016-04-12T00:00:00.000Z"), $lte: ISODate("2016-04-13T00:00:00.000Z")}}).forEach(function (tr) {
  if (!!tr.owner && tr.owner.length > 10) {
    db.transactions.update({_id: tr._id}, {$set: {whos: "mega_no"}});
    var u = db.preregisters.findOne({_id: ObjectId(tr.owner)});
    for (var i=0, l=u.transactions.length; i<l; i++) {
      if (u.transactions[i].card_number == tr.card_number) {
        u.transactions[i].whos = "mega_no";
        db.preregisters.update({_id: u._id}, {$set: {transactions: u.transactions}});
        print(changed_u);
        changed_u++;
      }
    }
  }
});

var changed_u = 0
db.weights.find({whos: "mega_nn", created_at: {$gte: ISODate("2016-04-12T00:00:00.000Z"), $lte: ISODate("2016-04-13T00:00:00.000Z")}}).forEach(function (tr) {
  if (!!tr.owner && tr.owner.length > 10) {
    db.weights.update({_id: tr._id}, {$set: {whos: "mega_no"}});
    var u = db.preregisters.findOne({_id: ObjectId(tr.owner)});
    for (var i=0, l=u.weights.length; i<l; i++) {
      if (u.weights[i].whos == "mega_nn") {
        u.weights[i].whos = "mega_no";
        print(changed_u);
        changed_u++;
      }
    }
    db.preregisters.update({_id: u._id}, {$set: {weights: u.weights}});
  }
});