var Cosmo = window.Cosmo;

Cosmo.Collections.Responses = Backbone.Collection.extend({
  initialize: function (options) {
    this.user = options.user;
  },

  model: Cosmo.Models.Response,

  comparator: function (response) {
    return response.get('response_category_id');
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
