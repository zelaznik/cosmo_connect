var Cosmo = window.Cosmo;

Cosmo.Collections.Users = Backbone.Collection.extend({
  url: 'api/users',
  model: Cosmo.Models.User,
});

Cosmo.Collections.UserSearch = Backbone.Collection.extend({
  url: 'api/users',
  model: Cosmo.Models.User,
  title: 'Search Results',
  description: 'Users Who Met Your Search Criteria'
});

Cosmo.Collections.Crushes = Backbone.Collection.extend({
  url: 'api/likes/crushes',
  model: Cosmo.Models.User,
  title: 'Likes',
  description: 'Crushes: i.e. people whom you like.'
});

Cosmo.Collections.SecretAdmirers = Backbone.Collection.extend({
  url: 'api/likes/secret_admirers',
  model: Cosmo.Models.User,
  title: 'Likes',
  description: 'Admirers: i.e. people who like you.'
});

Cosmo.Collections.Soulmates = Backbone.Collection.extend({
  url: 'api/likes/soulmates',
  model: Cosmo.Models.User,
  title: 'Likes',
  description: 'Soulmates: who knows why they like you back, but they do.'
});

Cosmo.Collections.ReceivedVisits = Backbone.Collection.extend({
  url: 'api/visits/received',
  model: Cosmo.Models.User,
  title: 'Visits',
  description: 'Received: people who have visited you.'
});

Cosmo.Collections.SentVisits = Backbone.Collection.extend({
  url: 'api/visits/sent',
  model: Cosmo.Models.User,
  title: 'Visits',
  description: 'Sent: people whom you have visited.'
});
