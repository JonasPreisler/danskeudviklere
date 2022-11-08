import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // $('.unread-messages-'+this.data.get('conversationId')).remove();
    $(".msg-body").animate({ scrollTop: $('.msg-body').prop("scrollHeight")}, 0);
  }

  submit() {
    $('#new_message').toggleClass('opacity-50');
  }

  reset() {


    this.element.reset();
    $('#new_message').toggleClass('opacity-50');
    $(".msg-body").animate({ scrollTop: $('.msg-body').prop("scrollHeight")}, 500);
  }

}
