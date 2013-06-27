Puntificate.Router.map (match)->
  # match('/').to('index')
  @resource 'challenges', ->
    @resource 'challenge', { path: ':challenge_id' }

Puntificate.IndexRoute = Ember.Route.extend
  redirect: -> @transitionTo 'challenges'