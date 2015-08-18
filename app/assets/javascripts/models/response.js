var Cosmo = window.Cosmo;

Cosmo.Models.Response = Backbone.Model.extend({
  urlRoot: '/api/responses',
  initialize: function(options) {
    this.user = options.user;
  }
});
