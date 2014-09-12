/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp();

// Use `app.import` to add additional libraries to the generated
// output files.
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.
app.import('vendor/ember-data/ember-data.js');
app.import('vendor/embedly-jquery/jquery.embedly.js');
app.import('vendor/sanitize.js/lib/sanitize.js');
app.import('vendor/js-beautify/js/lib/beautify.js');
app.import('vendor/js-beautify/js/lib/beautify-html.js');
app.import('vendor/highlight.js/src/styles/github.css');
app.import('vendor/jquery-minicolors/jquery.minicolors.js');
app.import('vendor/jquery-minicolors/jquery.minicolors.css');


module.exports = app.toTree();
