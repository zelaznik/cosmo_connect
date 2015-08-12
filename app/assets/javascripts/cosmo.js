window.Cosmo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {
    new Cosmo.Routers.Router({
      $rootEl: $('#content'),
      $navBar: this.navBar()
    });
    Backbone.history.start();
  },

  navBar: function() {
    if (this._navBar)
    var view = 3;
  }
};

$(document).ready(function() {
  Cosmo.initialize();
});
