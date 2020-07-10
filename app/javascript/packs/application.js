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
import { initUpdateNavbarOnScroll } from "../DOM/dynamicNavbar"
import { initTags } from '../plugins/tag_choice'
import { initPopover } from '../plugins/popover_activation'
import { initSweetalert } from '../plugins/init_sweetalert';
import { initSubmitReport } from '../plugins/submit_report';


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


document.addEventListener('turbolinks:load', () => {
  bindSearchForm();
  autocomplete();
  initMap();
  previewImageOnFileSelect();
  initTags();
  initPopover();
  initSubmitReport();
  initUpdateNavbarOnScroll();
  initSweetalert('#sweet-alert-email', {
  title: "Thanks For Your Report!",
  text: "We understand that having a negative encounter with the police can cause serious emotional distress. If you'd like us to send you an email with mental health or legal resources in your area, add your email below. (Or, check out our 'Resources' page.)" ,
  content: {
    element: "input",
    attributes: {
      placeholder: "Enter Your City",
      type: "city",
    },
  },
  buttons: {
    cancel: "No, Thanks",
    confirm: "Yes, Please",
  }
});
});

import "controllers"
