const mysql = require('mysql');
const express = require('express');
//const bodyparser = require('body-parser');
var app = express();
//app.use(bodyparser.json());

var mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user:'root',
    password: 'password',
    database: 'mydb'
});

mysqlConnection.connect((err) =>
{
    if(!err)
    {
        console.log('Connection established Successfully!');
    }
    else
    {
        console.log('Connection Failed!' + JSON.stringify(err,undefined,2));
    }
});

const port = 8080;
app.listen(port, () => console.log(`Listening on port ${port}..`));

app.get('/learners', (req,res) =>
{
    mysqlConnection.query('SELECT * FROM learners', (err,rows) =>
    {
        if(!err)
        {
            res.send(rows);
        }
        else
        {
            console.log(err);
        }
    });
});
