var Cosmo = window.Cosmo;  //Stops Atom from fussing at me.

Cosmo.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'you',
    'sign_out': 'destroySession'
  },

  you: function() {
    var currentUser = new Cosmo.Models.User({
      id: Cosmo.CURRENT_USER_ID
    });

    currentUser.fetch({
      success: function () {
        var view = new Cosmo.Views.UserShow({
          model: currentUser
        });
        this._swapView(view);
      }.bind(this)
    });
  },

  destroySession: function() {
    $.ajax({
      type: 'DELETE',
      url: '/session',
      success: function () {
        window.location.replace('/session/new');
      }.bind(this)
    });
  },

  _swapView: function (view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
