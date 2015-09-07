var Cosmo = window.Cosmo;

Cosmo.Views.DesiredGenderIndexItem = Backbone.View.extend({
  template: JST['desired_genders/index_item'],
  className: 'row',

  render: function () {
    var content = this.template({
      desire: this.model
    });
    this.$el.html(content);
    return this;
  }

});
