window.Movie ||= {} # TODO is this necessary?
window.Movie.Views ||= {}

class Movie.Views.MultiplayerView extends Movie.Views.GamePlayView


  initialize: ->
    super()
    @$("h1.question").html("Waiting for Player 2 Game Will Start Shortly!")

  #
  # Override the parent timer function since this 
  # we want to instantiate a "multiplayer" GameResultView
  #
  timer: =>
    @count = @count - 1
    @$('h1.timer').html("<h1>#{@count} seconds left!</h1>")
    if @count <= 0
      window.clearInterval(@counter)
      @counter = 0
      @$('h1.timer').html("<h1>Times Up!!</h1>")
      new Movie.Views.GameResultView
        attributes:
          players: "multiplayer"
          correctAnswers: @correctAnswers
          totalQuestions: @questionNumber 
          playerName: @attributes.playerName