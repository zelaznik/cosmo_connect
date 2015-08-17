var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndexItem = Backbone.View.extend({
  template: JST['essays/index_item'],

  className: 'response-index-item',

  events: {
    'click .essay-edit': 'editEssay'
  },

  editEssay: function () {
    var modal = new Cosmo.Views.ResponseIndexItemForm({
      collection: this.collection,
      model: this.model
    });
    $('#content').append(modal.render().$el);
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({
      essay: this.model
    });
    this.$el.html(content);
    return this;
  }

});
