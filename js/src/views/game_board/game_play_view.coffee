window.Movie ||= {} # TODO is this necessary?
window.Movie.Views ||= {}

class Movie.Views.GamePlayView extends Backbone.View
  template: _.template($("#game_play_template").html())
    
  events:
    "click button" : "changeQuestion"

  el: '.container'

  initialize: ->
    @session = window.sessionID # TODO fix, shouldnt have to attach to window
    @questionNumber = 0
    @correctAnswers = 0
    @rightAnswer = new Audio("media/correct_ding.mp3")
    @wrongAnswer = new Audio("media/fail_buzzer.mp3")
  
    @session.addMessageListener('urn:x-cast:movie.quote.game', @onMessage)

    @render()



  onMessage:(e) =>
    message = e
    if message
      @startTrivia()


  startTrivia: ->
    @startCounter()


  startCounter: ->
    @choices = ["answer1","answer2","answer3","answer4"]
    rightAnswerSpace = @choices[Math.floor(Math.random()*@choices.length)]
    @modelss = @collection.where({consumed:false})
    currentModel = @modelss[Math.floor(Math.random()*@modelss.length)]
    question = currentModel.get("quote")
    @answer = currentModel.get("right")
    currentModel.set("consumed":true)
    @$("h1.question").html(question)
    $("##{rightAnswerSpace}").html(@answer)  
    @fillEmptySpaces(_.without(@choices,rightAnswerSpace))
    @count = 100
    @counter = window.setInterval(@timer, 1000)
    @questionNumber = @questionNumber + 1
    

  fillEmptySpaces:(openSlots) ->
    @fakeAnswers = []

    @collection.each (model) =>
      @fakeAnswers.push(model.get("right"))

    @shuffleArray(@fakeAnswers)
    @fillSlots(openSlots)

  fillSlots:(slotArray) ->
    slotArray.forEach (slot) =>
      unless @checkIfAnswerUsed(@fakeAnswers[0])
        $("##{slot}").html(@fakeAnswers.shift()) 
        slotArray = _.without(slotArray, slot)
      else
        @fakeAnswers.shift()
        @fillSlots(slotArray)

  checkIfAnswerUsed:(possibleAnswer) ->
    for slot in @choices
      return true if $("##{slot}").html() == possibleAnswer  

  shuffleArray:(unshuffled) ->
    for i in [unshuffled.length-1..1]
      j = Math.floor Math.random() * (i + 1)
      [unshuffled[i], unshuffled[j]] = [unshuffled[j], unshuffled[i]]
    @fakeAnswers = unshuffled



  #TODO clean up these methods
  changeQuestion:(e) ->
    @checkAnswer(e.currentTarget.innerHTML)
    choices = ["answer1","answer2","answer3","answer4"]
    rightAnswerSpace = choices[Math.floor(Math.random()*choices.length)]
    @modelss = @collection.where({consumed:false})
    currentModel = @modelss[Math.floor(Math.random()*@modelss.length)]
    question = currentModel.get("quote")
    @answer = currentModel.get("right")
    currentModel.set("consumed":true)
    @$("h1.question").html(question)
    $("##{rightAnswerSpace}").html(@answer)
    @fillEmptySpaces(_.without(choices,rightAnswerSpace))
    @questionNumber = @questionNumber + 1

  checkAnswer:(playerChoice) ->
    if playerChoice == @answer
      @$('h1.timer').html("<h1>CORRECT!</h1>")
      @correctAnswers = @correctAnswers + 1
      @rightAnswer.play()
    else
      @$('h1.timer').html("<h1>Wrong!</h1>")
      @wrongAnswer.play()
      

  timer: =>
    @count = @count - 1
    @$('h1.timer').html("<h1>#{@count} seconds left!</h1>")
    if @count <= 0
      window.clearInterval(@counter)
      @counter = 0
      @$('button').slideUp()
      @$("h1.question").slideUp()
      @$('h1.timer').html("<h1>Times Up! Preparing Results...</h1>")
      setTimeout =>
        new Movie.Views.GameResultView
          attributes:
            players: "single"
            correctAnswers: @correctAnswers
            totalQuestions: @questionNumber 
            playerName: @attributes.playerName
      , 5000
        
    


  render: ->
    @$el.html @template()

