$(document).on('turbolinks:load', function() {
  $('textarea#message_content').focus();
  submitNewMessage();
});

function submitNewMessage(){
  $('textarea#message_content').keydown(function(event) {
    if (event.keyCode == 13) {
        $('[data-send="message"]').click();
        $('[data-textarea="message"]').val("")
        return false;
     }
  });
}
