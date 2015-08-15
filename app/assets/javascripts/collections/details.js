var Cosmo = window.Cosmo;

Cosmo.Collections.Details = Backbone.Collection.extend({
  initialize: function (options) {
    this.user = options.user;
  },

  model: Cosmo.Models.Detail,

  comparator: function (detail) {
    return detail.get('detail_category_id');
  },

  getOrFetch: function (id) {
    var item = this.get(id);
    if (!item) {
      item = new this.model({id: id});
      item.fetch({
        success: function() {
          this.add(item);
        }
      });

    } else {
      item.fetch();
    }

    return item;
  }

});
