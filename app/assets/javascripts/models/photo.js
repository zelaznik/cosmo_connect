Cosmo.Models.Photo = Backbone.Model.extend({
  urlRoot: function () {
    return this.user.url() + '/photo';
  },

  initialize: function(options) {
    this.user = options.user;
  }

});
