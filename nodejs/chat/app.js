var app = require('http').createServer(handler)
  , io = require('socket.io').listen(app)
  , fs = require('fs')

app.listen(8080);

function handler (req, res) {
  fs.readFile(__dirname + '/index.html',
  function (err, data) {
    if (err) {
      res.writeHead(500);
      return res.end('Error loading index.html');
    }

    res.writeHead(200);
    res.end(data);
  });
}

io.sockets.on('connection', function (socket) {
	socket.on('saveNickname', function (nickname) {
		socket.nickname = nickname;
		socket.broadcast.emit('newUser', { nickname: socket.nickname, time: new Date().getTime() });
	});
	
	socket.on('sendMessage', function (message) {
		io.sockets.emit('receiveMessage', { nickname: socket.nickname, message: escape(message), time: new Date().getTime() });
	});

	socket.on('disconnect', function () {
		socket.broadcast.emit('user disconnected');
	});
});