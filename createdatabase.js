var mysql = require('mysql');
var readlineSync = require('readline-sync');

var con = mysql.createConnection({  //creating the connection to the database
    host: "localhost",
    user: "root",
    password: "password",
    database: 'mydb'
});

con.connect(function(err) {
if (err) throw err;
   console.log("Connected!");  // console if the database is connected
   con.query("CREATE DATABASE mydb3", function (err, result) {  // creating the database
    if (err) throw err;
    console.log("Database created");  
   });
});
