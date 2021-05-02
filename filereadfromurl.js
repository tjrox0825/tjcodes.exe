var http = require('http');
var url = require('url');
var fs = require('fs');
var path = require('path');

//Create a Server
http.createServer(function (req,res)
{
    if(req.url!='/favicon.ico')
    {
        var x = req.url;
        console.log(path.basename(x));
        fs.readFile("/Applications/MAMP/htdocs/AWP_Node/sample_http.txt"+x, function(err)
        {
            if (err)
            {
                return console.error(err);
            }
            console.log(data.toString());
        });
    }
});