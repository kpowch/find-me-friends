        console.log(data, "IM DATJKENFJWNFKJNWEFJKNWEFJK")

App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
        console.log(data, "IM DATJKENFJWNFKJNWEFJKNWEFJK")

    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    console.log(data, "IM DATJKENFJWNFKJNWEFJKNWEFJK")
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});