    console.log("MOMFOMOFEWMFWELKJFBWJEKBFKJHBWEKFJHBWEHJF")

$(document).on('turbolinks:load', function() {
  submitNewMessage();
});
    console.log("MOMFOMOFEWMFWELKJFBWJEKBFKJHBWEKFJHBWEHJF")

function submitNewMessage(){
  $('textarea#message_content_test').keydown(function(event) {
    console.log("MOMFOMOFEWMFWELKJFBWJEKBFKJHBWEKFJHBWEHJF")
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('[data-textarea="message"]').val(" ")
        return false;
     }
  });
}
