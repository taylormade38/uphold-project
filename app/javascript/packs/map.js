import mapStyle from './mapsStyle';

const initMap = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) { // don't try to build a map if there's no div#map to inject in
    //const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  let center;
  let zoom;
  if (mapElement.dataset.lng && mapElement.dataset.lat) {
    center = new google.maps.LatLng(mapElement.dataset.lat, mapElement.dataset.lng);
    zoom = 7;
  } else {
    center = new google.maps.LatLng(39.8283, -98.5795);
    zoom = 5;
  }

  const map = new google.maps.Map(mapElement, {
    center,
    zoom,
    styles: mapStyle
  });

  const markers = JSON.parse(mapElement.dataset.markers);
  console.log(markers)

  var heatmapData = markers.map((marker) => {
    return new google.maps.LatLng(marker.lat, marker.lng);
  } )


  var heatmap = new google.maps.visualization.HeatmapLayer({
    data: heatmapData
  });
  heatmap.setMap(map);
  //   if (markers) {
  //     map.addMarkers(markers);
  //   }
  //   if (markers === null) {
  //     map.setZoom(4.4);
  //   } else if (markers.length === 1) {
  //     map.setCenter(markers[0].lat, markers[0].lng);
  //     map.setZoom(14);
  //   } else {
  //     map.fitLatLngBounds(markers);
  //   }
}
}

export { initMap }
