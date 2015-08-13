var Cosmo = window.Cosmo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {
    var router = new Cosmo.Routers.Router({
      $rootEl: $('#content')
    });

    var nav = new Cosmo.Views.NavShow({
      router: router
    });

    $('#navbar').html(nav.render().$el);

    Backbone.history.start();
  }

};

$(document).ready(function() {
  Cosmo.initialize();
});
