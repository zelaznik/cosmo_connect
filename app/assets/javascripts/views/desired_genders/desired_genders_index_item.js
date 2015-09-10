var Cosmo = window.Cosmo;

Cosmo.Views.DesiredGenderIndexItem = Backbone.View.extend({
  template: JST['desired_genders/index_item'],
  model: Cosmo.Models.DesiredGender,
  className: 'row',

  events: {
    "click .toggle": "toggleLike",
  },

  initialize: function () {
    this.listenTo(this.model, 'sync change', this.render);
  },

  render: function () {
    var content = this.template({
      desire: this.model
    });
    this.$el.html(content);
    return this;
  },

  toggleLike: function(event) {
    attrs = {'interested': !this.model.get('interested')};
    this.model.save(attrs, {
      success: function () {
        this.render();
      }.bind(this)
    });
  }

});
