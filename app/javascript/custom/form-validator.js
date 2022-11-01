
// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()


// require at least one role-type
$(function() {
  var requiredCheckboxes = $('.role-types :checkbox[required]');
  requiredCheckboxes.change(function(){
    if(requiredCheckboxes.is(':checked')) {
        requiredCheckboxes.removeAttr('required');
    } else {
        requiredCheckboxes.attr('required', 'required');
    }
  });
});
// require at least one role-type
$(function() {
  var requiredCheckboxes = $('.role-levels :checkbox[required]');
  requiredCheckboxes.change(function(){
    if(requiredCheckboxes.is(':checked')) {
        requiredCheckboxes.removeAttr('required');
    } else {
        requiredCheckboxes.attr('required', 'required');
    }
  });
});