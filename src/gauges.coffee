request = require('request')

BASE_URI = 'https://secure.gaug.es'

class Gauges
  constructor: (@options) ->

  me: (cb) ->
    this.get('/me', {}, cb)

  updateMe: (params={}, cb) ->
    this.put('/me', params, cb)

  clients: (cb) ->
    this.get('/clients', {}, cb)

  createClient: (params={}, cb) ->
    this.post('/clients', params, cb)

  deleteClient: (id, cb) ->
    this.delete("/clients/#{id}", cb)

  gauges: (cb) ->
    this.get('/gauges', {}, cb)

  createGauge: (params={}, cb) ->
    this.post('/gauges', params, cb)

  gauge: (id, cb) ->
    this.get("/gauges/#{id}", {}, cb)

  updateGauge: (id, params={}, cb) ->
    this.put("/gauges/#{id}", params, cb)

  deleteGauge: (id, cb) ->
    this.delete("/gauges/#{id}", cb)

  shares: (id, cb) ->
    this.get("/gauges/#{id}/shares", {}, cb)

  share: (id, params={}, cb) ->
    this.post("/gauges/#{id}/shares", params, cb)

  unshare: (id, user_id, cb) ->
    this.delete("/gauges/#{id}/shares/#{user_id}", cb)

  content: (id, params={}, cb) ->
    this.get("/gauges/#{id}/content", params, cb)

  referrers: (id, params={}, cb) ->
    this.get("/gauges/#{id}/referrers", params, cb)

  traffic: (id, params={}, cb) ->
    this.get("/gauges/#{id}/traffic", params, cb)

  resolutions: (id, params={}, cb) ->
    this.get("/gauges/#{id}/resolutions", params, cb)

  technology: (id, params={}, cb) ->
    this.get("/gauges/#{id}/technology", params, cb)

  terms: (id, params={}, cb) ->
    this.get("/gauges/#{id}/terms", params, cb)

  engines: (id, params={}, cb) ->
    this.get("/gauges/#{id}/engines", params, cb)

  locations: (id, params={}, cb) ->
    this.get("/gauges/#{id}/locations", params, cb)

  token: ->
    @options.token

  #
  # private methods
  #
  get: (path, params={}, cb) ->
    request.get this.fullPath(path), this.reqOptions({ qs: params }), (err, res) ->
      cb(JSON.parse(res.body))

  post: (path, body={}, cb) ->
    request.post this.fullPath(path), this.reqOptions({ body: body }), (err, res) ->
      cb(JSON.parse(res.body))

  put: (path, body={}, cb) ->
    request.put this.fullPath(path), this.reqOptions({ body: body }), (err, res) ->
      cb(JSON.parse(res.body))

  delete: (path, cb) ->
    request.delete this.fullPath(path), this.reqOptions, (err, res) ->
      cb(JSON.parse(res.body))

  fullPath: (path) ->
    BASE_URI + path

  reqOptions: (hash={}) ->
    hash.headers ||= {}
    hash.headers['X-Gauges-Token'] = this.token()
    hash

module.exports = Gauges
