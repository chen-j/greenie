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

    def new
        authenticate_scorer!
        @new_match = Match.new
        render "new_match"
    end

    def create
        authenticate_scorer!
        @new_match = current_scorer.matches.create(match_params)
        redirect_to "/my_matches"
    end

    def destroy
        authenticate_scorer!
        Match.find(params[:id]).destroy
        redirect_to "/my_matches"
    end

    def update
        authenticate_scorer!
        @match = Match.find(params[:id])
        @match.update(match_params)
        # redirect_to match_path(@match)
    end

    private

    def match_params
        params.require(:match).permit(:teamAName, :teamBName, :venue, :teamAScore, :teamBScore, :city, :matchDate, :firstRef, :secondRef, :competition)
    end
end
