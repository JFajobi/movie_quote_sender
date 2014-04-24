// Generated by CoffeeScript 1.7.1
(function() {
  var _base,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Movie || (window.Movie = {});

  (_base = window.Movie).Views || (_base.Views = {});

  Movie.Views.GamePlayView = (function(_super) {
    __extends(GamePlayView, _super);

    function GamePlayView() {
      this.timer = __bind(this.timer, this);
      this.fillEmptySpaces = __bind(this.fillEmptySpaces, this);
      this.onMessage = __bind(this.onMessage, this);
      return GamePlayView.__super__.constructor.apply(this, arguments);
    }

    GamePlayView.prototype.template = _.template($("#game_play_template").html());

    GamePlayView.prototype.events = {
      "click button": "changeQuestion"
    };

    GamePlayView.prototype.el = '.container';

    GamePlayView.prototype.initialize = function() {
      this.session = window.sessionID;
      this.questionNumber = 0;
      this.correctAnswers = 0;
      this.rightAnswer = new Audio("media/correct_ding.mp3");
      this.wrongAnswer = new Audio("media/fail_buzzer.mp3");
      this.session.addMessageListener('urn:x-cast:movie.quote.game', this.onMessage);
      return this.render();
    };

    GamePlayView.prototype.onMessage = function(e) {
      var message;
      message = e;
      if (message) {
        return this.startTrivia();
      }
    };

    GamePlayView.prototype.startTrivia = function() {
      return this.startCounter();
    };

    GamePlayView.prototype.startCounter = function() {
      var choices, currentModel, question, rightAnswerSpace;
      choices = ["answer1", "answer2", "answer3", "answer4"];
      rightAnswerSpace = choices[Math.floor(Math.random() * choices.length)];
      this.modelss = this.collection.where({
        consumed: false
      });
      currentModel = this.modelss[Math.floor(Math.random() * this.modelss.length)];
      question = currentModel.get("quote");
      this.answer = currentModel.get("right");
      currentModel.set({
        "consumed": true
      });
      this.$("h1.question").html(question);
      $("#" + rightAnswerSpace).html(this.answer);
      this.fillEmptySpaces(_.without(choices, rightAnswerSpace));
      this.count = 20;
      this.counter = window.setInterval(this.timer, 1000);
      return this.questionNumber = this.questionNumber + 1;
    };

    GamePlayView.prototype.fillEmptySpaces = function(openSlots) {
      var fakeAnswers;
      fakeAnswers = [];
      _.each(this.collection, (function(_this) {
        return function(model) {
          return fakeAnswers.push(model.right);
        };
      })(this));
      return _.each(openSlots, (function(_this) {
        return function(slot) {
          return $("#" + slot).html(fakeAnswers.shift());
        };
      })(this));
    };

    GamePlayView.prototype.changeQuestion = function(e) {
      var choices, currentModel, question, rightAnswerSpace;
      this.checkAnswer(e.currentTarget.innerHTML);
      choices = ["answer1", "answer2", "answer3", "answer4"];
      rightAnswerSpace = choices[Math.floor(Math.random() * choices.length)];
      this.modelss = this.collection.where({
        consumed: false
      });
      currentModel = this.modelss[Math.floor(Math.random() * this.modelss.length)];
      question = currentModel.get("quote");
      this.answer = currentModel.get("right");
      currentModel.set({
        "consumed": true
      });
      this.$("h1.question").html(question);
      $("#" + rightAnswerSpace).html(this.answer);
      this.fillEmptySpaces(_.without(choices, rightAnswerSpace));
      return this.questionNumber = this.questionNumber + 1;
    };

    GamePlayView.prototype.checkAnswer = function(playerChoice) {
      if (playerChoice === this.answer) {
        this.$('h1.timer').html("<h1>CORRECT!</h1>");
        this.correctAnswers = this.correctAnswers + 1;
        return this.rightAnswer.play();
      } else {
        this.$('h1.timer').html("<h1>Wrong!</h1>");
        return this.wrongAnswer.play();
      }
    };

    GamePlayView.prototype.timer = function() {
      this.count = this.count - 1;
      this.$('h1.timer').html("<h1>" + this.count + " seconds left!</h1>");
      if (this.count <= 0) {
        window.clearInterval(this.counter);
        this.counter = 0;
        this.$('button').slideUp();
        this.$("h1.question").slideUp();
        this.$('h1.timer').html("<h1>Times Up! Preparing Results...</h1>");
        return setTimeout((function(_this) {
          return function() {
            return new Movie.Views.GameResultView({
              attributes: {
                players: "single",
                correctAnswers: _this.correctAnswers,
                totalQuestions: _this.questionNumber,
                playerName: _this.attributes.playerName
              }
            });
          };
        })(this), 5000);
      }
    };

    GamePlayView.prototype.render = function() {
      return this.$el.html(this.template());
    };

    return GamePlayView;

  })(Backbone.View);

}).call(this);