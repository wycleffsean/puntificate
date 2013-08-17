App.Views.Challenges ||= {}

class App.Views.Challenges.ChallengeView extends Backbone.View
  template: JST["backbone/templates/challenges/challenge"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
