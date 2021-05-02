var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/mydb";
//CRUD- CREATE, READ, UPDATE, DELETE
MongoClient.connect(url, function(err, db) 
{
  if (err) throw err;
   console.log("Database created!");
  var dbo = db.db("mydb");

  var myobj = {name:"Tarun Tanmay", address:"Kota"};
  //insert, insertOne,insertMany
  dbo.collection("student").insertOne(myobj,function(err,res)
  {
      if (err) throw err;
      console.log("Document 1 is inserted!");
  });
  
  var myobj = [{name: "Jai Verma", address: "Punjab", course: "ML"}, {name: "Sudhir Sharma", address: "Hyderabad", course: "AWP"}, {name: "Karan Garg", address: "Kota", course: "IOT"}, {name: "Aditya Mittal", address: "Shirpur", course: "Managemnet"}, {name:"Ishaan Raonka", address: "Kota", course:"Btech"}];
    dbo.collection("student").insertMany(myobj, function(err,res)
    {
        if (err) throw err;
        console.log("Document 2 inserted! ");
    });

   
   //this will retrieve the first document from collection*/
   dbo.collection("student").findOne({}, function(err,result)
    {
        if(err) throw err; //result will have id,name, address
        console.log(result);
    });

   //this will retrieve the name of the first studentdocument from collection

   dbo.collection("student").findOne({}, function(err, result) {
    if (err) throw err;
    console.log(result.name);
   });
    //this will retrieve all the document from collection

   dbo.collection("student").find({}, {projection:{ _id: 0, name: 1,address:1} }).toArray(function(err, result) {
    if (err) throw err;
    console.log(result);
    });
    //update employ set address="Kota" where name="Tarun Tanmay";
    dbo.collection("student").updateMany({name:"Tarun Tanmay"},{$set:{address:"Kota"}},function(err, result){
    if (err) throw err;
    console.log(result.n + " document(s) updated");
    });
          //this will retrieve all the document from collection where student name is "Tarun Tanmay"
    dbo.collection("student").find({}, {projection: { _id: 0, name: 1,address:1} }).toArray(function(err, result) {
    if (err) throw err;
    console.log(result);
    });
    
    dbo.collection("student").find({name:/^x/}, {projection: { _id: 0, name: 1,address:1} }).toArray(function(err, result) {
    if (err) throw err;
    console.log(result);
    });

   var mysort = { name:1};
    dbo.collection("student").find().sort(mysort).toArray(function(err, result) {
    if (err) throw err;
    console.log(result);
  }); 

  var myquery = {address: /^d/};
  dbo.collection("student").deleteMany(myquery, function(err, obj) {
    if (err) throw err;
    console.log(obj.result.n + " document(s) deleted");
  });

});
