var Cosmo = window.Cosmo;

Cosmo.Collections.DesiredGenders = Backbone.Collection.extend({
  initialize: function (options) {
    this.user = options.user;
  },

  model: Cosmo.Models.DesiredGender,

  comparator: function (response) {
    return response.get('gender_id');
  }

});
