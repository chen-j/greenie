class MatchesController < ApplicationController

    def index
        @matches = Match.order(matchDate: :asc)
        render "matches_home"
    end

end
