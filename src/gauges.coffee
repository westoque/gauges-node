request = require('request')

BASE_URI = 'https://secure.gaug.es'

###*
Object used to interact with Gaug.es.
@constructor
@example

var Gauges = require('gauges-node');
var client = new Gauges({ token: '...' });
client.gauges(function(body) {
  var gauges = body.gauges;
  console.log(gauges);
});
###
class Gauges
  constructor: (@options) ->

  ###*
  Gets the users details
  @param {Function} cb - the callback
  ###
  me: (cb) ->
    this.get('/me', {}, cb)

  ###*
  Updates users details
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  updateMe: (params={}, cb) ->
    this.put('/me', params, cb)

  ###*
  Shows clients
  @param {Function} cb - the callback
  ###
  clients: (cb) ->
    this.get('/clients', {}, cb)

  ###*
  Creates a client
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  createClient: (params={}, cb) ->
    this.post('/clients', params, cb)

  ###*
  Deletes client
  @param {String} id - the id of the client
  @param {Function} cb - the callback
  ###
  deleteClient: (id, cb) ->
    this.delete("/clients/#{id}", cb)

  ###*
  Shows gauges
  @param {Function} cb - the callback
  ###
  gauges: (cb) ->
    this.get('/gauges', {}, cb)

  ###*
  Creates a gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  createGauge: (params={}, cb) ->
    this.post('/gauges', params, cb)

  ###*
  Shows a gauge
  @param {String} id - the id of the gauge
  @param {Function} cb - the callback
  ###
  gauge: (id, cb) ->
    this.get("/gauges/#{id}", {}, cb)

  ###*
  Updates a gauge
  @param {String} id - the id of the gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  updateGauge: (id, params={}, cb) ->
    this.put("/gauges/#{id}", params, cb)

  ###*
  Deletes a gauge
  @param {String} id - the id of the gauge
  @param {Function} cb - the callback
  ###
  deleteGauge: (id, cb) ->
    this.delete("/gauges/#{id}", cb)

  ###*
  Shows the shares for a gauge
  @param {String} id - the id of the gauge
  @param {Function} cb - the callback
  ###
  shares: (id, cb) ->
    this.get("/gauges/#{id}/shares", {}, cb)

  ###*
  Shows a share for a gauge
  @param {String} id - the id of the gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  share: (id, params={}, cb) ->
    this.post("/gauges/#{id}/shares", params, cb)

  ###*
  Unshares a gauge for a share
  @param {String} id - the id of the gauge
  @param {Object} shareId - the id of the share
  @param {Function} cb - the callback
  ###
  unshare: (id, shareId, cb) ->
    this.delete("/gauges/#{id}/shares/#{shareId}", cb)

  ###*
  Shows content for a gauge
  @param {String} id - the id of the gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  content: (id, params={}, cb) ->
    this.get("/gauges/#{id}/content", params, cb)

  ###*
  Shows referrers for a gauge
  @param {String} id - the id of the gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  referrers: (id, params={}, cb) ->
    this.get("/gauges/#{id}/referrers", params, cb)

  ###*
  Shows traffic for a gauge
  @param {String} id - the id of the gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  traffic: (id, params={}, cb) ->
    this.get("/gauges/#{id}/traffic", params, cb)

  ###*
  Shows resolutions for a gauge
  @param {String} id - the id of the gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  resolutions: (id, params={}, cb) ->
    this.get("/gauges/#{id}/resolutions", params, cb)

  ###*
  Shows technology for a gauge
  @param {String} id - the id of the gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  technology: (id, params={}, cb) ->
    this.get("/gauges/#{id}/technology", params, cb)

  ###*
  Shows terms for a gauge
  @param {String} id - the id of the gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  terms: (id, params={}, cb) ->
    this.get("/gauges/#{id}/terms", params, cb)

  ###*
  Shows engines for a gauge
  @param {String} id - the id of the gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  engines: (id, params={}, cb) ->
    this.get("/gauges/#{id}/engines", params, cb)

  ###*
  Shows locations for a gauge
  @param {String} id - the id of the gauge
  @param {Object} params - the params
  @param {Function} cb - the callback
  ###
  locations: (id, params={}, cb) ->
    this.get("/gauges/#{id}/locations", params, cb)

  ###*
  Returns the token
  @returns {String} your gauges token
  ###
  token: ->
    @options.token

  ###*
  @private
  ###
  get: (path, params={}, cb) ->
    request.get this.fullPath(path), this.reqOptions({ qs: params }), (err, res) ->
      cb(JSON.parse(res.body))

  ###*
  @private
  ###
  post: (path, body={}, cb) ->
    request.post this.fullPath(path), this.reqOptions({ body: body }), (err, res) ->
      cb(JSON.parse(res.body))

  ###*
  @private
  ###
  put: (path, body={}, cb) ->
    request.put this.fullPath(path), this.reqOptions({ body: body }), (err, res) ->
      cb(JSON.parse(res.body))

  ###*
  @private
  ###
  delete: (path, cb) ->
    request.delete this.fullPath(path), this.reqOptions, (err, res) ->
      cb(JSON.parse(res.body))

  ###*
  @private
  ###
  fullPath: (path) ->
    BASE_URI + path

  ###*
  @private
  ###
  reqOptions: (hash={}) ->
    hash.headers ||= {}
    hash.headers['X-Gauges-Token'] = this.token()
    hash

module.exports = Gauges
