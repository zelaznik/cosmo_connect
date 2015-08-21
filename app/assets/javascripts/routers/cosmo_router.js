var Cosmo = window.Cosmo;  //Stops Atom from fussing at me.

Cosmo.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'you',
    'sign_out': 'destroySession',

    'users/index': 'userIndex',
    'users/:id': 'userShow',

    'likes/crushes': 'crushesIndex',
    'likes/secret_admirers': 'admirersIndex',
    'likes/soulmates': 'soulmatesIndex',

    'visits/sent': 'sentVisitsIndex',
    'visits/received': 'receivedVisitsIndex'
  },

  crushesIndex: function() {
    this._usersIndex(new Cosmo.Collections.Crushes());
  },

  admirersIndex: function() {
    this._usersIndex(new Cosmo.Collections.SecretAdmirers());
  },

  soulmatesIndex: function () {
    this._usersIndex(new Cosmo.Collections.Soulmates());
  },

  sentVisitsIndex: function() {
    this._usersIndex(new Cosmo.Collections.SentVisits());
  },

  receivedVisitsIndex: function () {
    this._usersIndex(new Cosmo.Collections.ReceivedVisits());
  },

  _usersIndex: function(users) {
    users.fetch();
    var view = new Cosmo.Views.UserIndex({
      collection: users
    });
    this._swapView(view);
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
