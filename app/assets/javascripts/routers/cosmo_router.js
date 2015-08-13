window.Cosmo.Routers.Router = Backbone.Router.extend({
  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'you',
    'sign_out': 'destroySession'
  },

  you: function() {
    var view = new Cosmo.Views.UserForm({

    });
    this._swapView(view);
  },

  destroySession: function() {
    $.ajax({type: 'DELETE', url: '/session'});
  },

  _swapView: function (view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
