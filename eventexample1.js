//Event emitter 
var events = require('events');
const e = require('express');
//creating object of EventEmitter class
var em = new events.EventEmitter();
em.on('FirstEvent', function(data)
{
    //synchronous events
    console.log('First Subscriber:' +" "+data);
});
em.on('SecondEvent', function(data)
{
    console.log('Second Subscriber:' +" "+data);
});
em.once('NewEvent', function(data)
{
    console.log(data);
});
em.on('status', function(code,msg)
{
    console.log('Got'+" "+code+" "+msg);
});
function c1()
{
    console.log("Event listener removed");
}

//Raising Events
em.emit('FirstEvent', 'This is Subscriber1!');
em.emit('SecondEvent', 'This is Subscriber2!');
em.emit('NewEvent', 'This is a new event!');
em.emit('status', 200, 'Ok!');
em.off('status', c1);