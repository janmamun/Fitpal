// app/assets/javascripts/dropdown.js
document.addEventListener('DOMContentLoaded', function () {
  var dropdownButton = document.querySelector('.navbar-toggler');
  var dropdownMenu = document.getElementById('navbarNav');

  dropdownButton.addEventListener('click', function () {
    if (dropdownMenu.classList.contains('collapse')) {
      dropdownMenu.classList.remove('collapse');
    } else {
      dropdownMenu.classList.add('collapse');
    }
  });
});
