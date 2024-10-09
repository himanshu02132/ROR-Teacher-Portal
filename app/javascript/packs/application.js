// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.



require("@rails/ujs").start()
require("@rails/activestorage").start()
require("@rails/actioncable")

// import 'bootstrap';
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap

// Optional: Import Bootstrap's CSS (if you're not importing via a SASS or SCSS file)
import 'bootstrap/dist/css/bootstrap.min.css';
import "../styles/application.scss"

import '@mdi/font/css/materialdesignicons.min.css';

import "../controllers";
