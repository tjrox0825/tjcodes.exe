var mysql = require('mysql');
var readlineSync = require('readline-sync');
var con = mysql.createConnection(
    {
        host: "localhost",
        user: "root",
        password: "password",
        database: 'mydb'
    }
);
con.connect(function(err)
{
    if (err) throw err;
    
    console.log('Connected Successful!');

    con.query("CREATE DATABASE mydb2", function(err,result)
    {
        if (err) 
        {
            console.log('err', err.message);
        }

        console.log("Database is created!");
    });

    var sql = "CREATE TABLE if not exists Employee(emp_id int primary key,empname varchar(25),dept_id int,salary int)";
    con.query(sql,function(err,result)
    {
        if (err) throw err;
        console.log("Table Created Successfully!");
    });

    var n=readlineSync.question('How many employees are there?');
    for (let i=0; i<n; i++)
    {
        var emp_id=readlineSync.question('Enter Employee id: ');
        var emp_name=readlineSync.question('Enter Employee name: ');
        var department_id=readlineSync.question('Enter Department id: ');
        var salary=readlineSync.question('Enter Employee salary: ');
        var sql = "INSERT INTO Employee VALUES?";
        var values=[[emp_id,emp_name,department_id,salary]];
        con.query(sql,[values], function(err,result)
        {
            if(err) throw err;
            console.log("Number of records inserted: " + result.affectedRows);
        });
    }
    con.query("SELECT * FROM Employee", function(err,result)
    {
        if (err) throw err;
        console.log(result);
        result.forEach((row) => {
            console.log(`${row.name}${row.address}`);
        });
    })
});