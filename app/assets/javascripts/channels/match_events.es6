App.match_events = App.cable.subscriptions.create("MatchEventsChannel", {
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
    var event_update = `<p class="match-event-comment col-sm-7" >
                            <span class="event_name col-sm-3"> ${data['event_name']} </span>
                            <span class="event_name col-sm-4"> ${data['team']} </span>
                            <span class="event_time col-sm-3 offset-md-2">${data['updated_at']}</span>
                            <span class="event_players col-sm-12">${data['event_players']} </span>
                            <span class="event_comment col-sm-12">${data['comment']}</span>
                        </p>`;
    if (data['event_name'] != undefined) {
        $(".match-comments").prepend(event_update);
    };
  },

});
