Cosmo.Collections.Photos = Backbone.Collection.extend({
  url: function() {
    return '/api/users/' + this.user.escape('id') + '/photos';
  },

  model: Cosmo.Models.Photo,

  initialize: function(options) {
    this.user = options.user;
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
