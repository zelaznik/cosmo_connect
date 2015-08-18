var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndexItem = Backbone.View.extend({
  template: JST['essays/index_item'],

  className: 'response-index-item',

  events: {
    'click .essay-edit': 'editEssay'
  },

  initialize: function (options) {
    this.isCurrentUser = options.isCurrentUser;
    this.listenTo(this.model, 'sync', this.render);
    debugger;
  },

  editEssay: function () {
    if (!this.isCurrentUser) {
      throw "Cannot edit the responses of another user.";
    }
    var modal = new Cosmo.Views.ResponseIndexItemForm({
      collection: this.collection,
      model: this.model
    });
    $('#content').append(modal.render().$el);
  },

  render: function () {
    debugger;
    var content = this.template({
      isCurrentUser: this.isCurrentUser,
      essay: this.model
    });
    this.$el.html(content);
    return this;
  }

});
