window.Cosmo.Collections.Users = Backbone.Collection.extend({
  url: 'api/uesrs',
  model: Cosmo.Models.User,

  getOrFetch: function(id) {
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
