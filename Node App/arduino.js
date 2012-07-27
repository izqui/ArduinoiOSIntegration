/*
	Node Modules Required:
	Express: $ npm install express
	SerialPort: $ npm install serialport


*/



var express = require("express");
var SerialPort = require("serialport").SerialPort;

var ardPort = "/dev/tty.usbmodem1d11"; // Put here your arduino Port

var serialPort = new SerialPort(ardPort);


var app = express.createServer();

app.get('/value/:value', function (req, res){
	res.send('Recieved value: '+ req.params.value);
	serialPort.write(req.params.value);
});

app.listen(8080, function(){
	console.log('Up and Running on port 8080');
});