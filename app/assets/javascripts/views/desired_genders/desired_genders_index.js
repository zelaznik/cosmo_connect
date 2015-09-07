var Cosmo = window.Cosmo;

Cosmo.Views.DesiredGendersIndex = Backbone.CompositeView.extend({
  template: JST['desired_genders/index'],

  initialize: function(options) {
    this.listenTo(this.collection, 'sync', this.render);
    this.collection.each(function(desire) {
      this.addDesireSubview(desire);
    }.bind(this));
  },

  render: function () {
    this.$el.html(this.template({
      //title: this.collection.title,
      //description: this.collection.description
    }));
    this.attachSubviews();
    return this;
  },

  addDesireSubview: function(desire) {
    var desireIndexItem = new Cosmo.Views.DesiredGenderIndexItem({
      collection: this.collection,
      model: desire
    });
    this.addSubview('.desired-gender-index-wrapper', desireIndexItem);
  }

});
