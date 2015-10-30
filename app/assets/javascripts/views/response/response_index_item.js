var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndexItem = Backbone.View.extend({
  template: JST['essays/index_item'],

  className: 'response-index-item',

  initialize: function (options) {
    this.user = options.user;
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'dblclick .response-index-item-body': 'editEssay',
    'click .essay-edit': 'editEssay',
    'submit #essay-form': 'submit',
    'click .essay-cancel': 'cancel'
  },

  editEssay: function() {
    this.render(true);
  },

  submit: function (event) {
    event.preventDefault();
    var obj = $(event.currentTarget).serializeJSON();
    this.model.save(obj.response, {
      success: function(responseIndexItem) {
        this.collection.add(responseIndexItem);
        this.remove();
        this.render(false);
      }.bind(this)
    });
    this.render(false);
  },

  cancel: function(event) {
    event.preventDefault();
    this.render(false);
  },

  render: function (editMode) {
    // Add event listeners if editMode === True
    var itemView = this;
    if (editMode) {
      $(document).on('keyup', handleKeys.bind(this));
    } else {
      $(document).unbind('keyup', handleKeys);
    }

    var content = this.template({
      editMode: !!editMode,
      essay: this.model,
      user: this.user
    });
    this.$el.html(content);
    return this;
  }

});
