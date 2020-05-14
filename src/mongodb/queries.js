
# create collection
db.createCollection("books")

# insert
db.books.insertMany([
  {
    name: "first",
    desc: "desc"
  },{
    name: "second",
    num_pages: 100
  },{
    author: "Vasya",
    type: "paper"
  }
])

# select all
db.books.find()

# pagination
db.books.find().skip(0).limit(10)
db.books.find().skip(10).limit(10)

# find by id
db.books.find({"_id" : ObjectId("4ecc05e55dd98a436ddcc47c")})