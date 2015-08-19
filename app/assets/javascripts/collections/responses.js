var Cosmo = window.Cosmo;

Cosmo.Collections.Responses = Backbone.Collection.extend({
  initialize: function (options) {
    this.user = options.user;
  },

  model: Cosmo.Models.Response,

  comparator: function (response) {
    return response.get('response_category_id');
  }

});
