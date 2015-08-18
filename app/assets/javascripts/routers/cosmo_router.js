var Cosmo = window.Cosmo;  //Stops Atom from fussing at me.

Cosmo.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'you',
    'sign_out': 'destroySession',
    'users/index': 'userIndex',
    'users/:id': 'userShow'
  },

  you: function() {
    this.userShow(Cosmo.CURRENT_USER_ID);
  },

  userShow: function(id) {
    var user = new Cosmo.Models.User({id: id});
    user.fetch();
    var view = new Cosmo.Views.UserShow({
      model: user
    });
    this._swapView(view);
  },

  userIndex: function () {
    var users = new Cosmo.Collections.Users();
    users.fetch();
    var usersView = new Cosmo.Views.UserIndex({
      collection: users
    });
    this._swapView(usersView);
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
