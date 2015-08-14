var Cosmo = window.Cosmo;

Cosmo.Models.User = Backbone.Model.extend({
  urlRoot: '/api/users',

  parse: function (r) {
    if (!r.responses) {
      this.responses().set(response.latest_entries);
    }
  },

  responses: function () {
    if (!this._responses) {
      this._responses = new Cosmo.Collections.Responses([], {collection: this});
    }
    return this._responses;
  }

});
