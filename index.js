var express = require('express');
var app = express();
var server = require('http').Server(app);
var spawn = require('child_process').spawn;

var isDeveloping = process.env.NODE_ENV !== 'production';
var port = isDeveloping ? 3000 : process.env.PORT;
var hostname = process.env.HOSTNAME || '0.0.0.0';
var running = false;

app.use(express.static(__dirname + '/public'));

app.get('/', function (req, res) {
  res.sendFile('Traffic_Light_Timing_Manager.html', { root: __dirname });
});

app.get('/modify', function (req, res) {
  var rq = req.query;
  //Validate numbers to see if a default of 5 should be set.
  for(var i in rq) {
    if(isNaN(rq[i])) {
      clog(rq[i] + ' is not a number. Setting equal to 5.');
      rq[i] = 5;
    }
  }
  //create new light
  light = createLightCustom(rq, light.current);
  //restart light interval
  runLights(light, 0);
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

//allow to set other predetermined values
var createLightCustom = function(r,c) {
  return {
    green: r.green_duration,
    yellow: r.yellow_duration,
    flashing: r.green_arrow_duration,
    red: r.red_duration,
    current: c
  };
};

var light = createLight();
var timer;

function runLights(light, currentStartingPin) {
  if(running) {
    clearTimeout(timer);
  }

  if(!running) {
    running = true;
  }
  console.log(currentStartingPin, light.current);
  timer = setTimeout(function() {
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
      console.log('There was an error switching lights');
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

function clog(msg) {
  console.log(msg);
}

initializeLights();
runLights(light, 0);

