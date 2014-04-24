window.Movie ||= {}
window.Movie.Services ||= {}

#
# Service that handles all things related to the chromecast api
#
class Movie.Services.CastService extends Backbone.View # TODO should this be a view?


  sendMessage:(message) ->
    @session = window.sessionID
    @session.sendMessage('urn:x-cast:movie.quote.game', message, @messageSuccess, @messageError)

  messageSuccess:(e) =>
    console.log e

  messageError:(e) =>
    console.log e