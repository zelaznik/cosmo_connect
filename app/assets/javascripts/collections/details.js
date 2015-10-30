var Cosmo = window.Cosmo;

Cosmo.Collections.Details = Backbone.Collection.extend({
  model: Cosmo.Models.Detail,

  initialize: function (options) {
    this.user = options.user;
  },

  comparator: function (detail) {
    return detail.get('detail_category_id');
  }

});
