var Cosmo = window.Cosmo;

Cosmo.Collections.Users = Backbone.Collection.extend({
  url: 'api/users',
  model: Cosmo.Models.User
});
