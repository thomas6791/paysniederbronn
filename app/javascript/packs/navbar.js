import { navBar } from '../components/navbar';
import { cookieFullscreen } from '../components/navbar';
navBar();
//cookieFullscreen();

import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = "pk.eyJ1IjoidGhvbWFzLTY3IiwiYSI6ImNrYW85NDVtejFpY2oycm82Zm15cmY5b2YifQ.wRce3zl0dvvYMd0sMPL-2w";
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11'
    });
  }
};
initMapbox();

