$(document).ready(function() {
  const amenities = {};
  const states = {};
  const cities = {}

  $('input[type="checkbox"]').on('change', function() {
    const $checkbox = $(this);
    const id = $checkbox.data('id');
    const name = $checkbox.data('name');

    if (this.checked) {
	    if ($checkbox.hasClass('amenity')) {
		    amenities[name] = id;
	    } else if ($checkbox.hasClass('state')) {
		    states[name] = id;
	    } else if ($checkbox.hasClass('city')) {
		    cities[name] = id;
	    }
    } else {
	    if ($checkbox.hasClass('amenity')) {
                    delete amenities[name]
            } else if ($checkbox.hasClass('state')) {
                    delete states[name]
            } else if ($checkbox.hasClass('city')) {
                    delete cities[name]
            }
    }
    const amenityNames = Object.keys(amenities).sort();
    const stateNames = Object.keys(states).sort();
    const cityNames = Object.keys(cities).sort();
    
    if ($checkbox.hasClass('state') || $checkbox.hasClass('city')) {
	    const locations = [...stateNames, ...cityNames].join(', ');
	    $('.locations h4').text(locations)
    } else if ($checkbox.hasClass('amenity')) {
	    $('.amenities h4').text(amenityNames.join(', '));
    }
  });

  $.get('http://localhost:5001/api/v1/status/', function(data) {
    if (data.status === 'OK') {
      $('#api_status').addClass('available');
    } else {
      $('#api_status').removeClass('available');
    }
  });

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

  $('.filters button').click(function() {
    $('.places article').remove(); // Remove all the articles inside the .places element
    const data = {
      amenities: Object.values(amenities),
      states: Object.values(states),
      cities: Object.values(cities)
    };

    $.ajax({
      type: 'POST',
      url: 'http://localhost:5001/api/v1/places_search',
      data: JSON.stringify(data),
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
