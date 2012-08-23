[![build status](https://secure.travis-ci.org/westoque/gauges-node.png)](http://travis-ci.org/westoque/gauges-node)
Gaug.es Node
============

Unofficial gaug.es node.js API library. Based on the official ruby gem.
library.

Install
-------

```sh
  npm install gauges-node
```

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

Docs
----

You can find the docs [Gauges Docs]:http://westoque.github.com/gauges-node/symbols/Gauges.html

TODO
----

* Add tests. I just did a quick convertion.
* Add docs.

Copyright
---------

MIT-LICENSE.
