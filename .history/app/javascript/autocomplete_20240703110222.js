document.addEventListener("DOMContentLoaded", function() {
  var input = document.getElementById('location');
  if (input) {
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.setFields(['address_component', 'geometry', 'icon', 'name']);
  }
});
