var fs = require("fs");
var rmdir = require('rmdir');
fs.mkdir('test/temp1',function(err)
{
    if(err)
    {
        return console.error(err);
    }
    console.log("Directory Created Successfully!");
});

fs.readdir('test', function(err,files)
{
    if(err)
    {
        return console.error(err);
    }

    files.forEach( function(file)
     {
         console.log(file); 
     });
});

rmdir('test', function(err)
{
    if(err)
    {
        console.log(err);
    }
});