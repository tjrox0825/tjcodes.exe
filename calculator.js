//importing the export module
var c = require('./calculatormodule');
//importing the prompt module, to give user input 
const val = require('prompt')
//getting input from the user
val.get(['a','b'], function(err,result)
{
    if(err)
    {
        return onerror(err);
    }
    //converting numbers a&b into Int datatype
    a = parseInt(result.a, 10);
    b=parseInt(result.b, 10);
    //displaying arithmetic solutions
    console.log("Addition: "+c.addition(a,b));
    console.log("Subtraction: "+c.subtraction(a,b));
    console.log("Multiplication: "+c.multiplication(a,b));
    console.log("Division: "+c.division(a,b));
});
//defining a function to handle errors
function onerror(err)
{
    console.log(err);
    return 1;
}