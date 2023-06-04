$(document).ready(function() {
  const amenityObj = {};

  $('input[type="checkbox"]').on('change', function() {
    const $checkbox = $(this);
    const amenityId = $checkbox.data('id');
    const amenityName = $checkbox.data('name');

    if ($checkbox.is(':checked')) {
      amenityObj[amenityName] = amenityId;
    } else {
      delete amenityObj[amenityName];
    }

    const amenityNames = Object.keys(amenityObj).sort();
    $('.amenities h4').text(amenityNames.join(', '));
  });

$(document).ready(function() {
    $.get('http://localhost:5001/api/v1/status/', function(data) {
        if (data.status === 'OK') {
            $('#api_status').addClass('available');
        } else {
            $('#api_status').removeClass('available');
        }
    });
});

$(() => {
    $.ajax({
        type: 'POST',
        url: 'http://localhost:5001/api/v1/places_search',
        data: '{}',
        dataType: 'json',
        contentType: 'application/json',
        success: function(data) {
	  const articles = data.map((place) => {
  		return `<article>
    		<h2>${place.name}</h2>
    		<div class="price_by_night">
    		<p>$${place.price_by_night}</p>
    		</div>
    		<div class="information">
      		<div class="max_guest">
        	<div class="guest_image"></div>
        	<p>${place.max_guest}</p>
      		</div>
      		<div class="number_rooms">
        	<div class="bed_image"></div>
        	<p>${place.number_rooms}</p>
      		</div>
      		<div class="number_bathrooms">
        	<div class="bath_image"></div>
        	<p>${place.number_bathrooms}</p>
      		</div>
    		</div>
    		<div class="description">
      		<p>${place.description}</p>
    		</div>
  		</article>`;
	});

	// Append the articles to the ".places" element using jQuery
	$('.places').append(articles);

     }
    });
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
