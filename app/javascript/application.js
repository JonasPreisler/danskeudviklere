// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"



document.querySelectorAll(".toast").forEach((toastTarget) => {
  return new bootstrap.Toast(toastTarget).show();
});

$(document).ready(function () {
  var tooltipTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="tooltip"]')
  );
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });
});


$(function() {
  AOS.init();
});

$(window).on('load', function() {
  AOS.refresh();
});

Notification.requestPermission().then(function (result) {
  if (result === "denied") {
    var message_to_grant_permission = '<div class="p-2 text-center bg-danger rounded position-absolute top-50 start-50 translate-middle border shadow">'+
                                        '<small class="text-light">'+
                                          'Please give permission in browser settings to receive notifications.'+ 
                                        '</small>'+
                                      '</div>'

    $('body').prepend(message_to_grant_permission);
  }
});