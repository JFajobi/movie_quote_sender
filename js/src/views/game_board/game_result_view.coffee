window.Movie ||= {}
window.Movie.Views ||= {}

class Movie.Views.GameResultView extends Backbone.View
  template: _.template($("#game_result_template").html())

  el: ".container"

  # Attributes passed to this view
  # correctAnswers: number of correctly guessed answers
  # totalQuestions: Total questions the player went through
  # playerName: the users name

  initialize: ->
    @singlePlayerStats() if @attributes.players == "single"
    @multiPlayerResults() if @attributes.players == "multiplayer"



  singlePlayerStats: ->
    @$el.html @template()
    @$('#player-name').html(@attributes.playerName)
    @$('#single-player-stats').html("You got #{@attributes.correctAnswers} out of #{@attributes.totalQuestions} questions right!")
    @render()

  multiPlayerResults: ->
    @$el.html @template()
    @$('#player-name').html(@attributes.playerName)
    @$('#single-player-stats').html("You got #{@attributes.correctAnswers} out of #{@attributes.totalQuestions} questions right!")
    @render()

  render: ->
    @