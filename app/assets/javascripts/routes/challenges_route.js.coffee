Puntificate.ChallengesRoute = Ember.Route.extend
  model: -> Puntificate.Challenge.find()

Puntificate.ChallengeRoute = Ember.Route.extend
  model: (params) -> Puntificate.Challenge.find(params.challenge_id).get('responses')