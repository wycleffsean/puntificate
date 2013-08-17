class App.Models.Challenge extends Backbone.Model
  paramRoot: 'challenge'

  defaults:
    body: null
    created_at: null
    updated_at: null
    cached_votes_total: 0
    cached_votes_score: 0
    cached_votes_up: 0
    cached_votes_down: 0
    user_name: null
    closed: null
    closed_at: null

class App.Collections.ChallengesCollection extends Backbone.Collection
  model: App.Models.Challenge
  url: '/challenges'
