var Cosmo = window.Cosmo;

Cosmo.Collections.Users = Backbone.Collection.extend({
  url: 'api/users',
  model: Cosmo.Models.User
});

Cosmo.Collections.Crushes = Backbone.Collection.extend({
  url: 'api/likes/crushes',
  model: Cosmo.Models.User
});

Cosmo.Collections.SecretAdmirers = Backbone.Collection.extend({
  url: 'api/likes/secret_admirers',
  model: Cosmo.Models.User
});

Cosmo.Collections.Soulmates = Backbone.Collection.extend({
  url: 'api/likes/soulmates',
  model: Cosmo.Models.User
});
