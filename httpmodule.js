// Including http and url module in the file
var http = require('http');
var url = require('url');

//creating a http server
http.createServer(function(req,res)
{   
    //Writing response Header 
    //content type indicates the response content type 
    res.writeHead(200, {'Content-Type': 'text/html'});
    //200 indicates the okay status 

    //writing to response message body
    res.write('Node.js http module started! <br/> <br/>');

    //true there means they are set to be decomposed
    var q = url.parse(req.url, true).query;

    //storing full name in txt named variable
    var txt= q.firstname + " "+q.lastname;

    //writing to repsonse body again
    res.write("Name: " + " " +txt);

    //ending the response
    res.end();
}).listen(9000);
console.log("Server is running at port 9001");