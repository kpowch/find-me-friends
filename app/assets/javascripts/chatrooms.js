$(document).on('turbolinks:load', function() {
  submitNewMessage();
});

function submitNewMessage(){
  $('textarea#message_content_test').keydown(function(event) {
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('[data-textarea="message"]').val("")
        return false;
     }
  });
}
