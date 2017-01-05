cards_error = []

db.transactions.find({}).forEach(function(t){
  if (!!t.owner && t.owner.length > 10) {
    var p = db.preregisters.findOne({_id: ObjectId(t.owner)});
    if (p !== null) {
      var need_add = true;
      if (!!p.transactions) {
        for (var i=0, l=p.transactions.length; i<l; i++) {
          if (p.transactions[i].card_number == t.card_number) {
            need_add = false;
            break;
          }
        }
      } else {
        p.transactions = [];
      }
      if (need_add) {
        p.transactions.push(t);
        var res = db.preregisters.update({phone: p.phone}, {$set: {transactions: p.transactions}});
        print(p._id + " " + p.phone + " " + t.card_number + " " + JSON.stringify(res));
      }
    } else {
      print(t.owner);
    }
  }
});
