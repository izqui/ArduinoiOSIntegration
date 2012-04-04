var express = require("express");
var SerialPort = require("serialport").SerialPort;

var serial = "/dev/tty.usbmodemfd121"; //serial port where your arduino is connected
var serialPort = new SerialPort();


var app = express.createServer()

app.get('/value/:value', function (req, res){


	res.send('Recieved value: '+ req.params.value);
	serialPort.write(req.params.value);
})

app.listen(8080, function(){

	console.log('Up and Running on port 8080');
})
