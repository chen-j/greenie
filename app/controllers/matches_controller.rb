class MatchesController < ApplicationController

    def index
        @matches = Match.order(matchDate: :asc)
        render "matches_home"
    end

    def show
        @match = Match.find(params[:id])
        render "match_details"
    end
end
