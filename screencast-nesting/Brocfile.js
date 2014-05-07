/* global require, module */
var mergeTrees  = require('broccoli-merge-trees');
var pickFiles   = require('broccoli-static-compiler');

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp({
  name: require('./package.json').name,
  getEnvJSON: require('./config/environment')
});

// Use this to add additional libraries to the generated output files.
app.import('vendor/ember-data/ember-data.js');

// MEDIUM
// --------------------------------------------------------------
app.import('vendor/medium-editor/dist/js/medium-editor.js');
app.import('vendor/medium-editor/dist/css/medium-editor.css');
app.import('vendor/medium-editor/dist/css/themes/flat.css');

// Semantic
// --------------------------------------------------------------
app.import('vendor/semantic/build/packaged/css/semantic.css');
app.import('vendor/semantic/build/uncompressed/modules/transition.js');
app.import('vendor/semantic/build/uncompressed/modules/dropdown.js');
app.import('vendor/semantic/build/uncompressed/modules/sidebar.js');




// If the library that you are including contains AMD or ES6 modules that
// you would like to import into your application please specify an
// object with the list of modules as keys along with the exports of each
// module as its value.
app.import('vendor/ic-ajax/dist/named-amd/main.js', {
  'ic-ajax': [
    'default',
    'defineFixture',
    'lookupFixture',
    'raw',
    'request',
  ]
});


var semanticFonts = pickFiles('vendor/semantic/build/packaged/fonts', {
  srcDir: '/',
  files: ['*'],
  destDir: '/fonts'
});


module.exports = mergeTrees([app.toTree(), semanticFonts]);
