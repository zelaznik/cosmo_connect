var Cosmo = window.Cosmo;

Cosmo.Models.User = Backbone.Model.extend({
  urlRoot: '/api/users',

  parse: function(r) {
    if (r.responses) {
      this.responses().set(r.responses);
      delete r.responses;
    }

    if (r.details) {
      this.details().set(r.details);
      delete r.details;
    }

    return r;
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
  }

});
