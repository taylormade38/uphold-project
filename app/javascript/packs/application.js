// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import {bindSearchForm} from '../components/reload_search_turbolinks';

import "../plugins/popover_activation";
import "../plugins/tag_choice";


import { autocomplete } from "../components/autocomplete"
import { initMap } from './map'
import { previewImageOnFileSelect } from '../components/photo_preview'
import { initUpdateNavbarOnScroll } from "../dom/dynamicNavbar"

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
autocomplete();
initMap();
previewImageOnFileSelect();

document.addEventListener('turbolinks:load', () => {
  bindSearchForm();
});
