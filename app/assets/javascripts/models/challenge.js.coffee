Puntificate.Challenge = DS.Model.extend
  body: DS.attr('string')
  url: DS.attr('string')
  responses: DS.hasMany('Puntificate.Response', { embedded: true })