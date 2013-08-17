module 'Challenge Model'

test 'defaults', ->
	defaults =
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
    deepEqual App.Models.Challenge::defaults, defaults

test 'serialization', ->
	challenge = new App.Models.Challenge()
	equal challenge.paramRoot, 'challenge', 'serialized object has proper root (i.e. model.toJSON() => { challenge: {...}})'
