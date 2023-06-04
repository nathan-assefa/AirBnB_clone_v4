$(document).ready(function() {
  const amenityObj = {};

  $('input[type="checkbox"]').change(function () {
    const $checkbox = $(this);
    const amenityId = $checkbox.data('id');
    const amenityName = $checkbox.data('name');

    if (this.checked) {
      amenityObj[amenityName] = amenityId;
    } else {
      delete amenityObj[amenityName];
    }

    const amenityNames = Object.keys(amenityObj).sort();
    $('.amenities h4').text(amenityNames.join(', '));
  });
});


/* $(document).ready(function() {
  const amenityIDs = [];

  $('input[type="checkbox"]').change(function() {
    const amenityID = $(this).data('id');
    // here we can also use if (this.checked)
    if ($(this).is(':checked')) {
      amenityIDs.push(amenityID);
    } else {
      const index = amenityIDs.indexOf(amenityID);
      if (index > -1) {
        amenityIDs.splice(index, 1);
      }
    }

    updateAmenitiesText();
  });

  function updateAmenitiesText() {
    const amenitiesText = amenityIDs.join(', ');
    $('.amenities h4').text(amenitiesText);
  }
}); */
