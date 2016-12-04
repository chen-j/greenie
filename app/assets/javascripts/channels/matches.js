App.matches = App.cable.subscriptions.create("MatchesChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    // var matchId;
    if (matchId = $('.match-body').data('match-id')) {
      return this.perform("follow", { match_id: matchId})
    } else {
        return this.perform("nofollow");
    };

    // if (matchId = $('.match-body').data('match-id')) {
    //     return this.perform("follow");
    // } else {
    //     return this.perform("nofollow");
    // };


  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".score1").html(data['score1'])
    $(".score2").html(data['score2'])
  },

  update: function() {
    return this.perform('update');
  }
});
