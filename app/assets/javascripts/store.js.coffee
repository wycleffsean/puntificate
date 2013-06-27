Puntificate.Store = DS.Store.extend
  revision: 4
  adapter: DS.RESTAdapter.create
    namespace: 'api/v1'

# Force responses to get loaded with the challenge
#Puntificate.Store.adapter.serializer.map 'Puntificate.Challenge', responses: { embedded: 'load' }