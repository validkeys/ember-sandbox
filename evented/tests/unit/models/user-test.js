import { test, moduleForModel } from 'ember-qunit';

moduleForModel('user', 'User', {
  // Specify the other units that are required for this test.
  needs: []
});

test('it exists', function() {
  var model = this.subject();
  // var store = this.store();
  ok(model);
});

test('it requires a first name', function() {
  var model = this.subject({
    first_name: "",
    last_name: "Davis"
  });

  equal(model.get('isValid'), false, "Model is invalid");

});
