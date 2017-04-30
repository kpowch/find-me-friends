App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $('#messages').removeClass('hidden');
    $('#messages').append(this.returnMessageElement(data));

    // Moves window down so most recent message is in view
    $('.messages-wrapper').scrollTop($('.panel-body.scrollable').height());
  },
  returnMessageElement: function(data) {
    // Determine the current user based on their cookie
    var user_cookie = document.cookie;
    // Split the cookie string to access just the first name
    var current_user = user_cookie.substring(user_cookie.indexOf('=') + 1);

    // Add currentUser class if message was written by current user
    if (current_user === data.user) {
      return "<div class='message-bubble currentUser'><p>" + data.user + ": " + data.message + "</p></div>";
    } else {
      return "<div class='message-bubble'><p>" + data.user + ": " + data.message + "</p></div>";
    }
  }
});
