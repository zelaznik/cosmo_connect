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

    if (r.interested_in) {
      this._preferences = r.interested_in;
      delete r.interested_in;
    }

    if (r.desired_genders) {
      this.desiredGenders().set(r.desired_genders);
      delete r.desired_genders;
    }

    return r;
  },

  like: function () {
    if (!this._like) {
      this._like = new Cosmo.Models.Like();
    }
    return this._like;
  },

  preferences: function () {
    if (!this._preferences) {
      var repr = [];
      this.desiredGenders().models.forEach(function(desire) {
        if (desire.interested) {repr.push(desire.plural);}
      });
      this._preferences = repr.join(', ');
    }
    return this._preferences;
  },

  desiredGenders: function () {
    // Returns a user's gender preferences
    if (!this._desires) {
      this._desires = new Cosmo.Collections.DesiredGenders({}, {user: this});
    }
    return this._desires;
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
  },

  birthdate: function() {
    return this.get('birthdate') || {'year': null, 'month': null, 'day': null};
  }

});
