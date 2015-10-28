var Cosmo = window.Cosmo;

var NewUserModal = Cosmo.Views.NewUserModal = Backbone.ModalView.extend({
  template: JST['users/new_user_modal'],

  render: function() {
    var content = this.template({
    });
    this.$el.html(content);
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    
    this.remove();
  }

});
