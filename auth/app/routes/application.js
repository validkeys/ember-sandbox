import Ember from 'ember';
import AuthApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin';
export default Ember.Route.extend( AuthApplicationRouteMixin, {


  actions:{
    // whenever the session is successfully authenticated
    sessionAuthenticationSucceeded: function(){
      this._super();
      console.log("Session auth succeeded");
    },

    // whenever an attempt to authenticate the session fails
    sessionAuthenticationFailed: function(){
      this._super();
      console.log("Session auth failed");
    },

    // whenever the session is successfully invalidated
    sessionInvalidationSucceeded: function(){
      this._super();
      console.log("Session invalidation succeeded");
    },

    // whenever an attempt to invalidate the session fails
    sessionInvalidationFailed: function(){
      this._super();
      console.log("Session invalidation failed");
    },

    // whenever the server rejects the authorization information passed with a request and responds with status 401
    authorizationFailed: function(){
      this._super();
      console.log("Session authorization failed");
    }
  }

});
