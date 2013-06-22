Puntificate.ChallengesRoute = Ember.Route.extend
  model: -> Puntificate.Challenge.find()
