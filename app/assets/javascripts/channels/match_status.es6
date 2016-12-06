App.match_status = App.cable.subscriptions.create("MatchStatusChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    if (matchId = $('.match-body').data('match-id')) {
      return this.perform("follow", { match_id: matchId})
    } else {
        return this.perform("nofollow");
    };
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".match-body").data( "match-status", data['new_match_status'] );
    console.log(data['new_match_status'] );
    if (data['new_match_status'] === "LIVE") {
        var new_match = `<p class="alert alert-success">MATCH IN PROGRESS.</p>`
    };
    if (data['new_match_status'] === "UPCOMING") {
        var new_match = `<p class="alert alert-danger">MATCH NOT YET STARTED.</p>`
    };
    if (data['new_match_status'] === "COMPLETED") {
        var new_match = `<p class="alert alert-warning">MATCH COMPLETED.</p>`
    };
    $(".match-state").html(new_match);
  },

  update: function() {
    return this.perform('update');
  }
});
