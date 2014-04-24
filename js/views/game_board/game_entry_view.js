// Generated by CoffeeScript 1.7.1
(function() {
  var _base,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Movie || (window.Movie = {});

  (_base = window.Movie).Views || (_base.Views = {});

  Movie.Views.GameEntryView = (function(_super) {
    __extends(GameEntryView, _super);

    function GameEntryView() {
      this.onRequestSessionSuccess = __bind(this.onRequestSessionSuccess, this);
      this.receiverListener = __bind(this.receiverListener, this);
      this.sessionListener = __bind(this.sessionListener, this);
      return GameEntryView.__super__.constructor.apply(this, arguments);
    }

    GameEntryView.prototype.template = _.template($("#game_entry_template").html());

    GameEntryView.prototype.events = {
      "click .cast-icon": "createCastSession",
      "click h1": "playNoise"
    };

    GameEntryView.prototype.el = '.container';

    GameEntryView.prototype.initialize = function() {
      this.messageNamespace = 'urn:x-cast:movie.quote.game';
      return this.checkCastAvailability();
    };

    GameEntryView.prototype.playNoise = function() {
      var readyFight;
      console.log("playing sound...");
      readyFight = new Audio("media/round_one_fight.mp3");
      return readyFight.play();
    };

    GameEntryView.prototype.checkCastAvailability = function() {
      return window['__onGCastApiAvailable'] = (function(_this) {
        return function(loaded, errorInfo) {
          if (loaded) {
            return _this.initializeCastApi();
          } else {
            return console.log(errorInfo);
          }
        };
      })(this);
    };

    GameEntryView.prototype.initializeCastApi = function() {
      var apiConfig, sessionRequest;
      window.CastService = new Movie.Services.CastService;
      sessionRequest = new chrome.cast.SessionRequest("F888BEF7");
      apiConfig = new chrome.cast.ApiConfig(sessionRequest, this.sessionListener, this.receiverListener);
      return chrome.cast.initialize(apiConfig, this.onInitSuccess, this.onError);
    };

    GameEntryView.prototype.onInitSuccess = function(e) {
      return console.log("working");
    };

    GameEntryView.prototype.onError = function(e) {
      return console.log("error: " + e);
    };

    GameEntryView.prototype.sessionListener = function(e) {
      return console.log("Session is " + e);
    };

    GameEntryView.prototype.receiverListener = function(e) {
      console.log("this is e: " + e);
      if (e === "available") {
        return this.showIdleCastIcon();
      } else {
        return this.showErrorCastIcon();
      }
    };

    GameEntryView.prototype.showIdleCastIcon = function() {
      this.$el.html(this.template());
      $('.cast-header').append("<div class='cast-icon-parent col-md-1 col-md-offset-10'><img src='media/cast_icon_error.png' class='cast-icon'></div>");
      return this.render();
    };

    GameEntryView.prototype.showErrorCastIcon = function() {
      this.$el.html(this.template());
      $('.cast-header').append("<div class='cast-icon-parent col-md-1 col-md-offset-10'><img src='media/cast_icon_error.png' class='cast-icon'></div>");
      return this.render();
    };

    GameEntryView.prototype.createCastSession = function() {
      console.log("click connect");
      return chrome.cast.requestSession(this.onRequestSessionSuccess, this.onLaunchError);
    };

    GameEntryView.prototype.onRequestSessionSuccess = function(e) {
      console.log("CONNECTED: " + e);
      window.sessionID = e;
      return new Movie.Views.PlayerSelectView;
    };

    GameEntryView.prototype.onLaunchError = function(e) {
      return console.log("Launch Error: " + e);
    };

    GameEntryView.prototype.render = function() {
      return this;
    };

    return GameEntryView;

  })(Backbone.View);

}).call(this);