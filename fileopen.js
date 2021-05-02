//Using fs module to open a file
//importing fs module 
var fs = require("fs");
//opening of file using fs module is asynchronous  
console.log("Opening File!");
fs.open('sample_http.txt', 'r+', function(err, fd)
{
    if(err)
    {
        return console.error(err);
    }

    
});