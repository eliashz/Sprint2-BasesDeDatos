db.restaurants.find();
db.restaurants.find({ }, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1});
db.restaurants.find({ }, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1, "_id": 0});
db.restaurants.find({ }, {"restaurant_id": 1, "name": 1, "borough": 1, "address.zipcode": 1, "_id": 0});
db.restaurants.find({"borough": "Bronx"});
db.restaurants.find({"borough": "Bronx"}).limit(5);
db.restaurants.find({"borough": "Bronx"}).limit(5).skip(5);
db.restaurants.find({"grades.score":{$gt: 90}});
db.restaurants.find({"grades.score": {$gt: 80, $lt: 100}});
db.restaurants.find({"address.coord.0": {$lt: -95.754168 }});
db.restaurants.find({$and: [{"cuisine": {$not: {$regex: "American "}}}, {"grades.score": {$gt: 70}}, {"address.coord.0": {$lt: -65.754168}}]});

db.restaurants.find({$and: [{"cuisine": {$not: {$regex: "American "}}}, {"grades.grade": "A"}, {"borough": {$not: {$regex: "Brooklyn"}}}]}).sort({"cuisine": -1});
db.restaurants.find({"name": /^Wil/}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1});
db.restaurants.find({"name": /ces$/}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1});
db.restaurants.find({"name": /Reg/}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1});
db.restaurants.find({$and: [{"borough": "Bronx"}, {"cuisine":{ $in: ["American ", "Chinese"]}}]});
db.restaurants.find({$or: [{"borough":"Staten Island"}, {"borough":"Queens"}, {"borough":"Bronx"}, {"borough":"Brooklyn"}]}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1});
db.restaurants.find({$nor: [{"borough":"Staten Island"}, {"borough":"Queens"}, {"borough":"Bronx"}, {"borough":"Brooklyn"}]}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1});
db.restaurants.find({"grades.score": {$lt: 10}}, {"restaurant_id": 1, "name": 1, "borough": 1, "cuisine": 1});

db.restaurants.find({ $and: [{"grades.grade": "A"},{"grades.score": 11},{"grades.date": ISODate("2014-08-11T00:00:00Z")}]}, {"_id": 1, "name": 1, "grades": 1});
db.restaurants.find({$and: [{"grades.2.grade": "A"}, {"grades.2.score": 11}, {"grades.date": ISODate("2014-08-11T00:00:00Z")}]}, {"_id": 1, "name": 1, "grades": 1});
db.restaurants.find({$and:[{"address.coord.1": {$gt:42}}, {"address.coord.1": {$lte: 52}}]}, {"restautant_id": 1, "name": 1, "address": 1});
db.restaurants.find().sort({name: 1});
db.restaurants.find().sort({name: -1});
db.restaurants.find().sort({"cuisine": 1, "borough": -1});
db.restaurants.find({ "address.street": { $exists: true } });
db.restaurants.find({"address.coord": {$type: "double"}});

db.restaurants.find({"name": /mon/} , {"name": 1, "borough": 1, "address.coord": 1, "cuisine":1});
db.restaurants.find({"name": /^Mad/} , {"name": 1, "borough": 1, "address.coord": 1, "cuisine":1});