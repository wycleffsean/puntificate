Puntificate.Response = DS.Model.extend
  body: DS.attr('string')
  challengeId: DS.attr('number')
  challenge: DS.belongsTo('Puntificate.Challenge')
