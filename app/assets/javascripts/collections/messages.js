var Cosmo = window.Cosmo;

Cosmo.Collections.Messages = Backbone.Collection.extend({
  initialize: function (options) {
    this.user = options.user;
  },

  model: Cosmo.Models.Message,

  comparator: function (response) {
    return response.get('created_at');
  }

});

Cosmo.Collections.SentMessages = Cosmo.Collections.Messages.extend({
  url: 'api/messages/sent'
});

Cosmo.Collections.ReceivedMessages = Cosmo.Collections.Messages.extend({
  url: 'api/messages/received'
});
