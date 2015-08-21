var Cosmo = window.Cosmo;

Cosmo.Views.NewMessageForm = Backbone.ModalView.extend({
  template: JST['messages/form'],
  sendMesssage: function(event) {
    event.preventDefault();
    var obj = $(event.currentTarget).serializeJSON();
    
  }
});
