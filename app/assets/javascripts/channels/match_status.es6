App.match_status = App.cable.subscriptions.create("MatchStatusChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    var matchId;
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

    if (data['new_match_status'] === "UPCOMING") {
        var new_match = `<p class="alert alert-danger">MATCH NOT YET STARTED.</p>`
        var clock = $('.clock').html("");
    };

    if (data['new_match_status'] === "LIVE") {
        var new_match = `<p class="alert alert-success">MATCH IN PROGRESS. FIRST PERIOD</p>`
        var clock = $('.clock').FlipClock({clockFace: 'MinuteCounter'});
    };

    if (data['new_match_status'] === "END OF QUARTER") {
        var new_match = `<p class="alert alert-success">MATCH IN PROGRESS. QUARTER INTERVAL</p>`
        var clock = $('.clock').html("");
    };

    if (data['new_match_status'] === "HALF TIME") {
        var new_match = `<p class="alert alert-success">MATCH IN PROGRESS. HALF TIME</p>`
        var clock = $('.clock').html("");
    };

    if (data['new_match_status'] === "2ND") {
        var new_match = `<p class="alert alert-success">MATCH IN PROGRESS. SECOND PERIOD</p>`
        var clock = $('.clock').FlipClock({clockFace: 'MinuteCounter'});
    };

    if (data['new_match_status'] === "3RD") {
        var new_match = `<p class="alert alert-success">MATCH IN PROGRESS. THIRD PERIOD</p>`
        var clock = $('.clock').FlipClock({clockFace: 'MinuteCounter'});
    };

    if (data['new_match_status'] === "4TH") {
        var new_match = `<p class="alert alert-success">MATCH IN PROGRESS. FOURTH PERIOD</p>`
        var clock = $('.clock').FlipClock({clockFace: 'MinuteCounter'});
    };

    if (data['new_match_status'] === "COMPLETED") {
        var new_match = `<p class="alert alert-warning">MATCH COMPLETED.</p>`
        var clock = $('.clock').html("");
    };

    $(".match-state").html(new_match);

  },

  update: function() {
    return this.perform('update');
  }
});
