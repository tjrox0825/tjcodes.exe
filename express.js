//Hello World Program using Node.js through Express web framework
const express = require('express');
const app = express();
const port = 9002;
app.get('/',(req,res) => 
{
    res.send(`Hello World! This is port 9002`);
});

app.listen(port,() =>
{
    console.log(`Application is listening at port ${port}!`);
});