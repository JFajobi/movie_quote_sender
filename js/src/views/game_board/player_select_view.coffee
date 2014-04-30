window.Movie ||= {}
window.Movie.Views ||= {}

class Movie.Views.PlayerSelectView extends Backbone.View
  template: _.template($("#player_select_template").html())

  events:
    "click #single-player"    : "playerNumber"
    "click #multi-player"     : "playerNumber"
    "click #send-player-name" : "sendPlayerName"
    "click input"             : "displayMessage"

  el: '.container'

  initialize: ->
    @render()

  #
  # send a message to the reciever app stating
  # if the upcoming game is single-player or multi-player
  #
  playerNumber:(e) ->
    window.CastService.sendMessage({playerNumber: e.currentTarget.id})
    if e.currentTarget.id == "single-player"
      window.CastService.sendMessage({displayMessage: "Getting Ready To Start!"})
      new Movie.Views.GamePlayView
        attributes:
          playerName: @playerName
        collection: new Movie.Collection.GameCollection
    else
      window.CastService.sendMessage({ready: "ready"})
      new Movie.Views.MultiplayerView
        attributes:
          playerName: @playerName
        collection: new Movie.Collection.GameCollection
    
  sendPlayerName:(e) ->
    @playerName = @$('input').val()
    window.CastService.sendMessage({setPlayerInfo: @playerName })
    @$(".player-name-form").addClass("hidden")
    @$(".player-button-group").removeClass("hidden")

  displayMessage: ->
    window.CastService.sendMessage({displayMessage: "Selecting Player Names"})






  render: ->
    @$el.html @template()
