var map_x;
var map_y;
var contents = "";
var map;

function setLocation(x, y) {
	map_x = x;
	map_y = y;
}

function initialize() {
	var cairo = {lat: map_x, lng: map_y};
	var mapOptions = {
		zoom : 16,
		scaleControl: true,
		/* center: new google.maps.LatLng(35.87110100714382, 128.60169690333006) */
		center : cairo
	};
	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	
	var infowindow = new google.maps.InfoWindow;
	infowindow.setContent('<b>' + contents + '</b>');
	
	var marker = new google.maps.Marker({map: map, position: cairo});
	marker.addListener('click', function() {
	  infowindow.open(map, marker);
	});
}

function geocode(map, content) {
	if(map == null || !map) {
		return false;
	}
	contents = content;
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({
		'address' : map,
		'partialmatch' : true
	}, geocodeResult);
}

function geocodeResult(results, status) {
	//if( status == google.maps.GeocoderStatus.OK ) {
	if (status == 'OK' && results.length > 0) {
		//map.fitBounds(results[0].geometry.viewport);
		setLocation(results[0].geometry.location.lat(), results[0].geometry.location.lng());
		initialize();
	} else {
		var table = document.getElementById('form-group');
		table.removeChild(document.getElementById('map-canvas'));
//		alert("Geocode was not successful for the following reason: "
//				+ status);
	}
}
/* google.maps.event.addDomListener(window, 'load', geocode());  */