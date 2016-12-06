class PagesController < ApplicationController


    def index
      @live_matches = Match.where(matchStatus: "LIVE")
      render "home"
    end

end
