var express = require('express');
var app = express();
var server = require('http').Server(app);
var spawn = require('child_process').spawn;

var isDeveloping = process.env.NODE_ENV !== 'production';
var port = isDeveloping ? 3000 : process.env.PORT;
var hostname = process.env.HOSTNAME || '0.0.0.0';

app.use(express.static(__dirname + '/public'));

app.get('/', function (req, res) {
  res.sendFile('Traffic_Light_Timing_Manager.html', { root: __dirname });
});

app.get('/modify', function (req, res) {
  console.log(req.query);
});

server.listen(port, hostname, function () {
  console.log('Listening on port %s. Open http://localhost:%s in browser.', port, port);
});

var lightBits = {
  green: [0,0],
  yellow: [0,1],
  flashing: [1,0],
  red: [1,1]
};

var createLight = function() {
  return {
    green: 10,
    yellow: 2,
    flashing: 4,
    red: 2,
    current: 'red'
  };
};

var light = createLight();

function runLights(light, currentStartingPin) {
  console.log(currentStartingPin, light.current);
  setTimeout(function() {
    switch(light.current) {
    case 'red':
      // Switch to other light then flashing
      currentStartingPin = currentStartingPin === 0 ? 2 : 0;
      light.current = 'flashing';
      break;
    case 'green':
      // Switch to yellow
      light.current = 'yellow';
      break;
    case 'yellow':
      // Switch to red
      light.current = 'red';
      break;
    case 'flashing':
      // Switch to green
      light.current = 'green';
      break;
    default:
      console.log('wtf');
    }
    switchLight(light.current, currentStartingPin);
    return runLights(light, currentStartingPin);
  }, light[light.current] * 1000);
}

function lightSwitch(pin, toggle) {
  spawn('bash', ['./gpio.sh', pin, toggle]);
}

function switchLight(lightColor, currentStartingPin) {
  lightSwitch(currentStartingPin, lightBits[lightColor][0]);
  lightSwitch(currentStartingPin + 1, lightBits[lightColor][1]);
}

function initializeLights() {
  for (i = 0; i < 4; i++)
    lightSwitch(i, 1);
}

initializeLights();
runLights(light, 0);

