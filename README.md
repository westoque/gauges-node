Gaug.es Node
============

Unofficial gaug.es node.js API library. Based on the official ruby gem.
library.

Usage
-----

```js
  // List the titles of your gauges
  var Gauges = require('gauges-node');
  var client = new Gauges({ token: '...' });
  client.gauges(function(body) {
    var gauges = body.gauges;
    console.log(gauges);
  });
```

TODO
----

Add tests. I just did a quick convertion.

Copyright
---------

MIT-LICENSE.
