function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var reportAddress = document.getElementById('report_address');

    if (reportAddress) {
      console.log('hi')
      console.log(google.maps)
      var autocomplete = new google.maps.places.Autocomplete(reportAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(reportAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
