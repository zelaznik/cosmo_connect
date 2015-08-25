var Cosmo = window.Cosmo;

Cosmo.Collections.Messages = Backbone.Collection.extend({
  model: Cosmo.Models.Message,

  comparator: function (message) {
    return message.get('created_at');
  }

});

Cosmo.Collections.SentMessages = Cosmo.Collections.Messages.extend({
  url: 'api/messages/sent',
  model: Cosmo.Models.Message,
  title: 'Messages',
  description: 'sent'
});

Cosmo.Collections.ReceivedMessages = Cosmo.Collections.Messages.extend({
  url: 'api/messages/received',
  model: Cosmo.Models.Message,
  title: 'Messages',
  description: 'received'
});
