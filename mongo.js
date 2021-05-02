var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/mydb";

MongoClient.connect(url,function(err,db)
{
    if (err) throw err;
        console.log("Database Created!");
    var dbo=db.db("mydb");
   /* dbo.collection("student").drop(function(err,res)
    {
        if (err) throw err;
        if (res) console.log("Collection Deleted!");
    });

    dbo.createCollection("student", function(err,res)
    {
        if (err) throw err;
        console.log("Collection Created!");
    });*/

    var myobj = {name:"Tarun Tanmay", address:"Kota"};
    dbo.collection("student").insertOne(myobj,function(err,res)
    {
        if (err) throw err;
        console.log("Document 1 is inserted!");
    });

    var myobj = [{name: "Jai Verma", address: "Punjab", course: "ML"}, {name: "Sudhir Sharma", address: "Hyderabad", course: "AWP"}, {name: "Karan Garg", address: "Kota", course: "IOT"}, {name: "Aditya Mittal", address: "Shirpur", course: "Managemnet"}, {name:"Ishaan Raonka", address: "Kota", course:"Btech"}]
    dbo.collection("student").insertMany(myobj, function(err,res)
    {
        if (err) throw err;
        console.log("Document 2 inserted! ");
    });

    dbo.collection("student").findOne({}, function(err,result)
    {
        if(err) throw err;
        console.log(result);
    });

    dbo.collection("student").findOne({},function(err,result)
    {
        if (err) throw err;
        console.log(result.name);
    });

  

    dbo.collection("student").find({}, {projection:{_id: 0, name: 1, address: 1}}).toArray(function(err,result)
    {
        if (err) throw err;
        console.log(result);
    })
});