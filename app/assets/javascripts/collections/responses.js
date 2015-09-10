var Cosmo = window.Cosmo;

Cosmo.Collections.Responses = Backbone.Collection.extend({
  model: Cosmo.Models.Response,

  initialize: function (options) {
    this.user = options.user;
  },

  comparator: function (response) {
    return response.get('response_category_id');
  }

});
