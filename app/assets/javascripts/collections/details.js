var Cosmo = window.Cosmo;

Cosmo.Collections.Details = Backbone.Collection.extend({
  initialize: function (options) {
    this.user = options.user;
  },

  model: Cosmo.Models.Detail,

  comparator: function (detail) {
    return detail.get('detail_category_id');
  }

});
