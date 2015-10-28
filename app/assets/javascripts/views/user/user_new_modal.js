var Cosmo = window.Cosmo;

var NewUserModal = Cosmo.Views.NewUserModal = Backbone.ModalView.extend({
  template: JST['users/new_user_modal'],

  initialize: function(options) {
    this.user = options.user;
  },

  render: function() {
    var content = this.template({
      user: this.user
    });
    this.$el.html(content);
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var form = $('#new-user-info').serializeObject();
    var interested_in = [];
    var data = {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
      'user[id]': Cosmo.CURRENT_USER_ID,
      'user[gender_id]': $('#new-user-info input[name="gender_identity"]:checked').val(),
      'user[birthdate][year]': form['birthdate[year]'],
      'user[birthdate][month]': form['birthdate[month]'],
      'user[birthdate][day]': form['birthdate[day]'],
      'user[min_age]': $('#min_age').val(),
      'user[max_age]': $('#max_age').val(),
      'user[interested_in]': interested_in
    };

    gender_interests = $('#new-user-info input[name="gender_interest"]:checked');
    for (var i =0; i< gender_interests.length; i++) {
      interested_in.push(gender_interests[i].value);
    }

    var view = this;

    $.ajax({
      url: '/api/users/' + Cosmo.CURRENT_USER_ID,
      dataType: 'json',
      type: 'PATCH',
      data: data,
      success: function(data) {
        view.remove();
      },
      error: function() {
        view.remove();
      }
    });
  }

});
