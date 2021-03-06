var Cosmo = window.Cosmo = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {
    var router = Cosmo.router = new Cosmo.Routers.Router({
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

  $('.login').on('click', function(event) {
    if (event.target.className === 'login') {
      window.location.replace('/session/new');
    }
  });

});
