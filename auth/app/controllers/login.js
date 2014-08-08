import Ember from 'ember';
import AuthLoginControllerMixin from 'simple-auth/mixins/login-controller-mixin';

export default Ember.Controller.extend(AuthLoginControllerMixin, {
  authenticator: 'simple-auth-authenticator:oauth2-password-grant'
});
