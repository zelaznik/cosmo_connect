var Cosmo = window.Cosmo;

Cosmo.Collections.DesiredGenders = Backbone.Collection.extend({
  model: Cosmo.Models.DesiredGender,

  initialize: function (options) {
    this.user = options.user;
  },

  comparator: function (desire) {
    return desire.get('gender_id');
  }

});
