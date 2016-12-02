class MatchesController < ApplicationController

    def index
        @matches = Match.order(matchDate: :asc)
        render "matches_home"
    end

    def show
        @match = Match.find(params[:id])
        @match_events = @match.match_events
        @new_match_event = MatchEvent.new
        render "match_details"
    end

    def my_matches
        authenticate_scorer!
        @matches = Match.where(scorer_id: current_scorer.id)
        render "my_matches"
    end

end
