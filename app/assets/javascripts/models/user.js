var Cosmo = window.Cosmo;

Cosmo.Models.User = Backbone.Model.extend({
  urlRoot: '/api/users',

  initialize: function () {
    this.isCurrentUser = ((+Cosmo.CURRENT_USER_ID) === (+this.id));
  },

  parse: function(r) {
    if (r.responses) {
      this.responses().set(r.responses);
      delete r.responses;
    }

    if (r.details) {
      this.details().set(r.details);
      delete r.details;
    }

    if (r.like) {
      this.like().set({id: r.like});
      delete r.like;
    }

    if (r.messages) {
      this.messages().set(r.messages);
      delete r.messages;
    }

    return r;
  },

  like: function () {
    if (!this._like) {
      this._like = new Cosmo.Models.Like();
    }
    return this._like;
  },

  details: function() {
    if (!this._details) {
      this._details = new Cosmo.Collections.Details([], {

        user: this});
    }
    return this._details;
  },

  responses: function () {
    if (!this._responses) {
      this._responses = new Cosmo.Collections.Responses([], {user: this});
    }
    return this._responses;
  },

  messages: function() {
    if (!this._messages) {
      this._messages = new Cosmo.Collections.Messages([], {user: this});
    }
    return this._messages;
  },

  preferences: function() {
    return "Not Implemented";
  }

});
