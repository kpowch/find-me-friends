App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    console.log(data, "EFEW")
    // if (data.user === data.current_user) {
     // return "<div> <p class='currentUser'> <b>" + data.user + ": </b>" + data.message + "</p> </div>";
    // } else {
      return "<div> <p> <b>" + data.user + ": </b>" + data.message + "</p> </div>";
    // }
  }
});