var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndexItem = Backbone.View.extend({
  template: JST['essays/index_item'],

  className: 'response-index-item',

  events: {
    'click .essay-edit': 'editEssay'
  },

  initialize: function (options) {
    this.user = options.user;
    this.listenTo(this.model, 'sync', this.render);
  },

  editEssay: function () {
    if (!this.user.isCurrentUser) {
      throw "Cannot edit the responses of another user.";
    }
    var modal = new Cosmo.Views.ResponseIndexItemForm({
      collection: this.collection,
      model: this.model,
      user: this.user
    });
    $('#content').append(modal.render().$el);
  },

  render: function () {
    var content = this.template({
      essay: this.model,
      user: this.user
    });
    this.$el.html(content);
    return this;
  }

});
