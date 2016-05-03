var express = require('express');
var app = express();
var server = require('http').Server(app);
var spawn = require('child_process').spawn;
// spawn runs a command
// commenting out because no point in creating a file every server start
// Docs: https://nodejs.org/api/child_process.html#child_process_child_process_spawn_command_args_options
var test = spawn('bash', ['./test.sh']);

var isDeveloping = process.env.NODE_ENV !== 'production';
var port = isDeveloping ? 3000 : process.env.PORT;
var hostname = process.env.HOSTNAME || '0.0.0.0';

app.use(express.static(__dirname + '/public'));

app.get('/', function (req, res) {
  res.sendFile('Traffic_Light_Timing_Manager.html', { root: __dirname });
})

server.listen(port, hostname, function () {
  console.log('Listening on port %s. Open http://localhost:%s in browser.', port, port);
})
