
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