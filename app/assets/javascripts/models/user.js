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

    if (r.photos) {
      this.photos().set(r.photos);
      delete r.photos;
    }

    if (r.like) {
      this.like().set({id: r.like});
      delete r.like;
    }

    return r;
  },

  like: function () {
    if (!this._like) {
      this._like = new Cosmo.Models.Like();
    }
    return this._like;
  },

  responses: function () {
    if (!this._responses) {
      this._responses = new Cosmo.Collections.Responses([], {user: this});
    }
    return this._responses;
  },

  details: function () {
    if (!this._details) {
      this._details = new Cosmo.Collections.Details([], {user: this});
    }

    return this._details;
  },

  photos: function () {
    if (!this._photos) {
      this._photos = new Cosmo.Collections.Photos([], {user: this});
    }

    return this._photos;
  },

  headshot: function() {
    return this.photos()[0];
  }

});
