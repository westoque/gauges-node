var Gauges = require('./../lib/gauges');
var client = new Gauges({ token: '...' });
client.gauges(function(body) {
  var gauges = body.gauges;
  console.log(gauges);
});
