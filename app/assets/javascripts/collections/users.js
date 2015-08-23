var Cosmo = window.Cosmo;

Cosmo.Collections.Users = Backbone.Collection.extend({
  url: 'api/users',
  model: Cosmo.Models.User,
  title: 'Generic User Collection. Please Override With Specific Subclass'
});

Cosmo.Collections.UserSearch = Backbone.Collection.extend({
  url: 'api/users',
  model: Cosmo.Models.User,
  title: 'Users Who Met Your Search Criteria'
});

Cosmo.Collections.Crushes = Backbone.Collection.extend({
  url: 'api/likes/crushes',
  model: Cosmo.Models.User,
  title: 'People Whom You Like'
});

Cosmo.Collections.SecretAdmirers = Backbone.Collection.extend({
  url: 'api/likes/secret_admirers',
  model: Cosmo.Models.User,
  title: 'People Who Like You'
});

Cosmo.Collections.Soulmates = Backbone.Collection.extend({
  url: 'api/likes/soulmates',
  model: Cosmo.Models.User,
  title: 'All Of These People Lke You Back!'
});

Cosmo.Collections.ReceivedVisits = Backbone.Collection.extend({
  url: 'api/visits/received',
  model: Cosmo.Models.User,
  title: 'People Who Have Visited You'
});

Cosmo.Collections.SentVisits = Backbone.Collection.extend({
  url: 'api/visits/sent',
  model: Cosmo.Models.User,
  title: 'People Whom You Have Visited'
});
