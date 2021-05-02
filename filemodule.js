//filemodule.js file: Importing fs module
var fs = require('fs');
//read functionality:
fs.readFile('sample_http.txt',function(err,data)
{
    if(err)
    {
        return console.error(err);
    }
    console.log(data.toString());
});
//reading the data from the sample file 
var data = fs.readFileSync('sample_http.txt');
console.log("Synchronous Read: " + data.toString());

//writing data to sample file
console.log("Writing into existing file");
fs.writeFile('sample_http.txt', 'This is node.js and we are implemneting fs write', 'utf8', function(err,data){
    
    if (err)
    {
        return console.error(err);
    }
    console.log("Data written Successfully!");

    //fs read 
    fs.readFile('sample_http.txt', function(err,data1)
    {
        if (err)
        {
            return console.error(err);
        }
        console.log("Asynchronous Read:" + data1.toString());
    });
});

var data2= "\n Learn Node.js \n";

//fs append
fs.appendFile('sample_http.txt', data2, 'utf8', function(err)
{
    if (err) throw err;
    // if no error
    console.log("Data is appended to file successfully!");
});