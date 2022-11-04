import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // $('.unread-messages-'+this.data.get('conversationId')).remove();
  }

  submit() {
    $('#new_message').toggleClass('opacity-50');
  }

  reset() {

    this.element.reset();
    $('#new_message').toggleClass('opacity-50');
    $("#messages").animate({ scrollTop: $('#messages').prop("scrollHeight")}, 1000);
  }

}
