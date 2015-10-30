var Cosmo = window.Cosmo;

Cosmo.Collections.Details = Backbone.Collection.extend({
  detail_order: {
    'birthdate': 0,
    'gender': 1,
    'interested_in': 2,
    'ages': 3,
    'religion': 4,
    'relationship_status': 5,
    'height': 6,
    'body_type': 7,
    'ethnicity': 8
  },

  model: Cosmo.Models.Detail,

  initialize: function (options) {
    this.user = options.user;
  },

  comparator: function (detail) {
    return this.detail_order[detail];
  }

});
