App.matches = App.cable.subscriptions.create("MatchesChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    alert(data['message']);
  },

  update: function() {
    return this.perform('update');
  }
});
