Cosmo.Collections.Photos = Backbone.Collection.extend({
  url: function() {
    return '/api/users/' + this.user.escape('id') + '/photos';
  },

  model: Cosmo.Models.Photo,

  initialize: function(options) {
    this.user = options.user;
  }

});
