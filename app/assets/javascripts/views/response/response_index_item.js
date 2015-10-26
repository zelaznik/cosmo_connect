var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndexItem = Backbone.View.extend({
  template: JST['essays/index_item'],

  className: 'response-index-item',

  initialize: function (options) {
    this.user = options.user;
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'click .essay-edit': 'editEssay',
    'submit #essay-form': 'submit'
  },

  editEssay: function() {
    // Rerender with the edit form visible.
    this.render(true);
  },

  submit: function (event) {
    event.preventDefault();
    var obj = $(event.currentTarget).serializeJSON();
    this.model.save(obj.response, {
      success: function (responseIndexItem) {
        this.collection.add(responseIndexItem);
        this.remove();
        this.render(false);
      }.bind(this)
    });
  },

  render: function (editMode) {
    var content = this.template({
      editMode: !!editMode,
      essay: this.model,
      user: this.user
    });
    this.$el.html(content);
    return this;
  }

});
