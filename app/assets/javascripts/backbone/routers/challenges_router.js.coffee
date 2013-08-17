class App.Routers.ChallengesRouter extends Backbone.Router
  initialize: (options) ->
    @challenges = new App.Collections.ChallengesCollection()
    @challenges.reset options.challenges

  routes:
    "new"      : "newChallenge"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newChallenge: ->
    @view = new App.Views.Challenges.NewView(collection: @challenges)
    $("#challenges").html(@view.render().el)

  index: ->
    @view = new App.Views.Challenges.IndexView(challenges: @challenges)
    $("#challenges").html(@view.render().el)

  show: (id) ->
    challenge = @challenges.get(id)

    @view = new App.Views.Challenges.ShowView(model: challenge)
    $("#challenges").html(@view.render().el)

  edit: (id) ->
    challenge = @challenges.get(id)

    @view = new App.Views.Challenges.EditView(model: challenge)
    $("#challenges").html(@view.render().el)
