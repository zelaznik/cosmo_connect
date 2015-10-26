var Cosmo = window.Cosmo;  //Stops Atom from fussing at me.

Cosmo.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    'about': 'aboutUs',

    '': 'you',
    'sign_out': 'destroySession',

    'users/index': 'searchResults',
    'users/:id': 'userShow',

    'likes/crushes': 'crushesIndex',
    'likes/secret_admirers': 'admirersIndex',
    'likes/soulmates': 'soulmatesIndex',

    'visits/sent': 'sentVisitsIndex',
    'visits/received': 'receivedVisitsIndex',

    'messages/sent': 'sentMessagesIndex',
    'messages/received': 'receivedMessagesIndex',
    'messages/chats': 'chatsIndex',
    'messages/:id': 'messageHistory'
  },

  aboutUs: function () {
    this._swapView(new Cosmo.Views.AboutShow());
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

  searchResults: function () {
    this._usersIndex(new Cosmo.Collections.UserSearch());
  },


  sentMessagesIndex: function () {
    this._messagesIndex(new Cosmo.Collections.SentMessages());
  },

  receivedMessagesIndex: function () {
    this._messagesIndex(new Cosmo.Collections.ReceivedMessages());
  },

  chatsIndex: function () {
    alert("Chat History Not Implemented");
  },


  you: function() {
    this.userShow(Cosmo.CURRENT_USER_ID);
  },

  messageHistory: function(id) {
    var user = new Cosmo.Models.User({id: id});
    user.fetch();
    var view = new Cosmo.Views.MessageIndex({
      collection: user.messages()
    });
    this._swapView(view);
  },

  userShow: function(id) {
    var user = new Cosmo.Models.User({id: id});
    user.fetch();
    var view = new Cosmo.Views.UserShow({
      model: user
    });
    this._swapView(view);
  },

  _usersIndex: function(users) {
    users.fetch();
    var view = new Cosmo.Views.UserIndex({
      collection: users
    });
    this._swapView(view);
  },

  _messagesIndex: function(messages) {
    messages.fetch();
    var view = new Cosmo.Views.MessageIndex({
      collection: messages
    });
    this._swapView(view);
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
