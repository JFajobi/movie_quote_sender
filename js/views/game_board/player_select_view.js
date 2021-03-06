// Generated by CoffeeScript 1.7.1
(function() {
  var _base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Movie || (window.Movie = {});

  (_base = window.Movie).Views || (_base.Views = {});

  Movie.Views.PlayerSelectView = (function(_super) {
    __extends(PlayerSelectView, _super);

    function PlayerSelectView() {
      return PlayerSelectView.__super__.constructor.apply(this, arguments);
    }

    PlayerSelectView.prototype.template = _.template($("#player_select_template").html());

    PlayerSelectView.prototype.events = {
      "click #single-player": "playerNumber",
      "click #multi-player": "playerNumber",
      "click #send-player-name": "sendPlayerName",
      "click input": "displayMessage"
    };

    PlayerSelectView.prototype.el = '.container';

    PlayerSelectView.prototype.initialize = function() {
      return this.render();
    };

    PlayerSelectView.prototype.playerNumber = function(e) {
      window.CastService.sendMessage({
        playerNumber: e.currentTarget.id
      });
      if (e.currentTarget.id === "single-player") {
        window.CastService.sendMessage({
          displayMessage: "Getting Ready To Start!"
        });
        return new Movie.Views.GamePlayView({
          attributes: {
            playerName: this.playerName
          },
          collection: new Movie.Collection.GameCollection
        });
      } else {
        window.CastService.sendMessage({
          ready: "ready"
        });
        return new Movie.Views.MultiplayerView({
          attributes: {
            playerName: this.playerName
          },
          collection: new Movie.Collection.GameCollection
        });
      }
    };

    PlayerSelectView.prototype.sendPlayerName = function(e) {
      this.playerName = this.$('input').val();
      window.CastService.sendMessage({
        setPlayerInfo: this.playerName
      });
      this.$(".player-name-form").addClass("hidden");
      return this.$(".player-button-group").removeClass("hidden");
    };

    PlayerSelectView.prototype.displayMessage = function() {
      return window.CastService.sendMessage({
        displayMessage: "Selecting Player Names"
      });
    };

    PlayerSelectView.prototype.render = function() {
      return this.$el.html(this.template());
    };

    return PlayerSelectView;

  })(Backbone.View);

}).call(this);
