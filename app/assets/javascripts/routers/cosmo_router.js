window.Cosmo.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'profile'
  },

  profile: function() {

  }

});
