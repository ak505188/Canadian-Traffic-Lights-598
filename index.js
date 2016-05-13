var express = require('express');
var app = express();
var server = require('http').Server(app);
var spawn = require('child_process').spawn;

var isDeveloping = process.env.NODE_ENV !== 'production';
var port = isDeveloping ? 3000 : process.env.PORT;
var hostname = process.env.HOSTNAME || '0.0.0.0';
var running = false;

var lightBits = {
  green: [0,0],
  yellow: [0,1],
  flashing: [1,0],
  red: [1,1]
};

var light = {
  green: 10,
  yellow: 2,
  flashing: 4,
  red: 2,
  current: 'red'
};

//allow to set other predetermined values
function createLightCustom(query, current_light) {
  return {
    green: query.green_duration,
    yellow: query.yellow_duration,
    flashing: query.green_arrow_duration,
    red: query.red_duration,
    current: current_light
  };
}

function newLightDelays(query) {
  //Validate numbers to see if a default of 5 should be set.
  for(var i in query) {
    if(isNaN(query[i])) {
      console.error(query[i] + ' is not a number. Setting equal to 5.');
      query[i] = 5;
    }
  }
  return query;
}

function initializeLights() {
  for (i = 0; i < 4; i++)
    lightSwitch(i, 1);
}

function lightSwitch(pin, toggle) {
  spawn('bash', ['./pi_scripts/gpio.sh', pin, toggle]);
}

function switchLight(lightColor, currentStartingPin) {
  lightSwitch(currentStartingPin, lightBits[lightColor][0]);
  lightSwitch(currentStartingPin + 1, lightBits[lightColor][1]);
}

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
      console.error('There was an error switching lights');
    }
    switchLight(light.current, currentStartingPin);
    return runLights(light, currentStartingPin);
  }, light[light.current] * 1000);
}

app.use(express.static(__dirname + '/public'));

app.get('/', function (req, res) {
  res.sendFile('Traffic_Light_Timing_Manager.html', { root: __dirname });
});

app.get('/modify', function (req, res) {
  //create new light
  light = createLightCustom(newLightDelays(req.query), light.current);
  //restart light interval
  runLights(light, 0);
  res.status(202).sendFile('Traffic_Light_Timing_Manager.html', { root: __dirname });
});

server.listen(port, hostname, function () {
  console.log('Listening on port %s. Open http://localhost:%s in browser.', port, port);
});

initializeLights();
runLights(light, 0);

