window.Movie ||= {}
window.Movie.Views ||= {}

class Movie.Views.GameEntryView extends Backbone.View
  template: _.template($("#game_entry_template").html())

  events:
    "click .cast-icon" : "createCastSession"
    "click h1" : "playNoise"

  el: '.container'



  initialize: ->
    @messageNamespace = 'urn:x-cast:movie.quote.game'
    @checkCastAvailability()

  playNoise: ->
    console.log("playing sound...")
    readyFight = new Audio("media/round_one_fight.mp3") 
    readyFight.play()


  # check to make sure the chromecast api is available
  checkCastAvailability: ->
    window['__onGCastApiAvailable'] = (loaded, errorInfo) => 
      if loaded
        @initializeCastApi()
      else
        console.log(errorInfo)
  #
  # If API is available initialize it 
  #
  initializeCastApi: ->
    window.CastService = new Movie.Services.CastService #TODO fix this, dont think I need to instantiate a view
    sessionRequest = new chrome.cast.SessionRequest("F888BEF7")
    apiConfig = new chrome.cast.ApiConfig sessionRequest, @sessionListener, @receiverListener
    chrome.cast.initialize apiConfig, @onInitSuccess, @onError

  onInitSuccess:(e) ->
    console.log "working"

  onError:(e) ->
    console.log "error: #{e}"


  sessionListener:(e) =>
    console.log "Session is #{e}"


  #
  # determines if there are any reciever apps available on this network
  #
  receiverListener:(e) =>
    console.log "this is e: #{e}"
    if e == "available"
      @showIdleCastIcon()
    else
      @showErrorCastIcon()

  #
  # Displays idle cast icon to indicate the sender app is ready to run
  # TODO need to change cast icon color
  showIdleCastIcon: ->
    @$el.html @template()
    $('.cast-header').append("<div class='cast-icon-parent col-md-1 col-md-offset-10'><img src='media/cast_icon_error.png' class='cast-icon'></div>") 
    @render()


  #
  # Displays an error icon and attempts to retry the process in 5 seconds until it connects
  #
  showErrorCastIcon: ->
    @$el.html @template()
    $('.cast-header').append("<div class='cast-icon-parent col-md-1 col-md-offset-10'><img src='media/cast_icon_error.png' class='cast-icon'></div>") 
    @render()


  createCastSession: ->
    console.log "click connect"
    chrome.cast.requestSession @onRequestSessionSuccess, @onLaunchError

  onRequestSessionSuccess:(e) =>
    console.log "CONNECTED: #{e}"
    window.sessionID = e
    new Movie.Views.PlayerSelectView

  onLaunchError:(e) ->
    console.log "Launch Error: #{e}"

  render: ->
    @