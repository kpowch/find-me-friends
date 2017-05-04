App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $('#messages').removeClass('hidden');
    $('#messages').append(this.returnMessageElement(data));

    // moves window down so most recent message is in view
    $('.chatroom-page').scrollTop($('.panel-body.scrollable').height());
  },

  returnMessageElement: function(data) {
    // determine the current user based on their cookie
    var user_cookie = document.cookie;
    // split the cookie string to access just the first name
    var current_user = user_cookie.substring(user_cookie.indexOf('=') + 1);

    // escape any potential html injections
    messageName = this.escapeHtmlInjection(data.user);
    messageContent = this.escapeHtmlInjection(data.message);

    // add currentUser class if message was written by current user
    if (current_user === data.user) {
      return "<div class='message-bubble currentUser'><p>" + messageName + ": " + messageContent + "</p></div>";
    } else {
      return "<div class='message-bubble'><p>" + messageName + ": " + messageContent + "</p></div>";
    }
  },

  // replaces html injection characters with their 'safe' alternative
  escapeHtmlInjection: function(string) {
    var entityMap = {
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      '"': '&quot;',
      "'": '&#39;',
      '/': '&#x2F;',
      '`': '&#x60;',
      '=': '&#x3D;'
    };

    return String(string).replace(/[&<>"'`=\/]/g, function (s) {
      return entityMap[s];
    });
  }
});
