class MatchesController < ApplicationController

    def index
        @matches = Match.all
        render "matches_home"
    end

end
