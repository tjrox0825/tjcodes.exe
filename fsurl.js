//importing the file system module
var http = require("http"); 
var fs = require("fs");
const url = require("url");

//fs read

const readdata = fs.readFileSync(  //synchronous read
  "sample_http.txt",
  "utf8",
  function (err, data) {
    console.log(data.to);
  },
);

console.log(
  "Writing in existing file",
);
fs.writeFileSync(  // synchronous write
  "sample_http.txt",
  "Sample text is taking over.",
  "utf8",
  function (err, data1) {
    if (err) {
      return console.error(
        err,
      );
    }

    console.log(
      "Data written successfully",
    );

    //fs read
    /*   fs.readFile(
      "Sample.txt",
      function (err, data1) {
        if (err) {
          return console.error(
            err,
          );
        }
        console.log(
          "Asynchronous read: " +
            data1.toString(),
        );
      },
    ); */
  },
);

var appenddata =
  "\nNew demonstrations have taken over old ones.";

fs.appendFile(  //appending the file with the new data
  "Sample.txt",
  appenddata,
  "utf8",
  function (err) {
    if (err) throw err;

    console.log(
      "Data is appended to file successfully",
    );
  },
);

http
  .createServer(
    (req, res) => {
      res.writeHead(200, {
        "Content-Type":
          "text/plain",
      });
      res.write(readdata);
      res.end();
    },
  ).listen(9002);
  console.log("Server is listening at 9002!")
