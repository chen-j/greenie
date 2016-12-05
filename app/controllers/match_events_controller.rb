class MatchEventsController < ApplicationController
    def create
        @match = Match.find(params[:match_id])
        # @new_match_event = @match.match_events.create!(match_event_params)
        # redirect_to match_path(@match)
        if @new_match_event = @match.match_events.create!(match_event_params)
          ActionCable.server.broadcast "match_#{@new_match_event[:match_id]}",
            event_name: @new_match_event.event_name,
            team: @new_match_event.team,
            event_players: @new_match_event.players,
            comment: @new_match_event.comment
            #head :ok
        end
    end

    private

    def match_event_params
        params.require(:match_event).permit(:event_name, :team, :players, :comment)
    end
end
