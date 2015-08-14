var Cosmo = window.Cosmo;

Cosmo.Views.ResponseIndex = Backbone.CompositeView.extend({
  template: JST['essays/index'],

  initialize: function () {
    this.listenTo(this.collection, 'add', this.addSubView);
    this.listenTo(this.collection, 'remove', this.removeResponse.bind(this));
    this.listenTo(this.collection, 'add remove', this.render);

    this.collection.each(function(response) {
      this.addResponseSubview(response);
    }.bind(this));

  },

  addResponseSubview: function (response) {
    var responseIndexItem = new Cosmo.Views.ResponseIndexItem({
      model: response
    });
    this.addSubview('.response-index-wrapper', responseIndexItem);
  },

  render: function() {
    var content = this.template({

    });
    this.$el.html(content);

    return this;
  },

  removeResponse: function(model) {
    this.removeModelSubview('.response-index', model);
  }

});
