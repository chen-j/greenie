class MatchEventsController < ApplicationController
    def create
        @match = Match.find(params[:match_id])
        @new_match_event = @match.match_events.create!(match_event_params)
        redirect_to match_path(@match)
    end

    private

    def match_event_params
        params.require(:match_event).permit(:event_name, :team, :players, :comment)
    end
end
