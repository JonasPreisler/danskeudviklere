// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
import "controllers"



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



$('.select2').select2({
  "language": {
      "noResults": function(){
       return "Ingen resultater";
      }
  },
   escapeMarkup: function (markup) {
       return markup;
   }
 });
