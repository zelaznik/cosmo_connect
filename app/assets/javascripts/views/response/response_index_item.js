var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndexItem = Backbone.View.extend({
  template: JST['essays/index_item'],

  className: 'response-index-item',

  initialize: function (options) {
    this.user = options.user;
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'submit #essay-form': 'submit'
  },

  submit: function (event) {
    event.preventDefault();
    var obj = $(event.currentTarget).serializeJSON();
    alert('obj: ' + obj);
    this.model.save(obj.response, {
      success: function (responseIndexItem) {
        alert("Success!");
        this.collection.add(responseIndexItem);
        this.remove();
      }.bind(this)
    });
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
