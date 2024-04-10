let map;
let markerLatLng;
let marker = []; 
let infoWindow = [];
const markerData = gon.spots; 
const markerDataLat = gon.spots_latitudes;
const markerDataLng = gon.spots_longitudes;

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), { 
    center: {lat: gon.prefecture.latitude, lng: gon.prefecture.longitude},
    zoom: 9,
    maxZoom: 15,
  });
  if (markerData != 0){
  map.fitBounds(new google.maps.LatLngBounds(
    {
      lat: Math.min(...markerDataLat),
      lng: Math.min(...markerDataLng),
    },
    {
      lat: Math.max(...markerDataLat),
      lng: Math.max(...markerDataLng),
    }
  ))};

  for (let i = 0; i < markerData.length; i++) {
    markerLatLng = new google.maps.LatLng({lat: markerData[i].latitude, lng: markerData[i].longitude}); 
    marker[i] = new google.maps.Marker({
      map: map,
      position: markerLatLng,
    });

    infoWindow[i] = new google.maps.InfoWindow({ 
    content: '<div class="info">' + markerData[i].name + '</div>' 
    });

    markerEvent(i);
  }
}

function markerEvent(i) {
  marker[i].addListener('click', function() { 
    infoWindow[i].open(map, marker[i]); 
  });
}

window.initMap = initMap
