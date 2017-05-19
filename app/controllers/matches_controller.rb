class MatchesController < ApplicationController

    def index
        @upcoming_matches = Match.where(matchdate: DateTime.now.to_date..Date.today.end_of_week)
        @matches = Match.order(matchdate: :asc)
        render "matches_home"
    end

    def show
        @match = Match.find(params[:id])
        @match_events = @match.match_events.reverse
        @new_match_event = MatchEvent.new
        render "match_details"
    end

    def my_matches
        authenticate_scorer!
        @matches = Match.where(scorer_id: current_scorer.id)
        if current_scorer.subscribed == false
            redirect_to "/subscribers/new"
        else
            render "my_matches"
        end
    end

    def results
        @match_results = Match.where(matchStatus: "COMPLETED").order(matchdate: :desc)
        render "match_results"
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
        if @match.update(match_params)
          ActionCable.server.broadcast "match_#{params[:id]}",
            score1: @match.teamAScore,
            score2: @match.teamBScore
          redirect_to "/matches/#{params[:id]}"
        end
    end

    def update_match_status
        @match = Match.find(params[:id])
        if @match.update(match_params)
          ActionCable.server.broadcast "match_#{params[:id]}",
            new_match_status: @match.matchStatus
          redirect_to "/matches/#{params[:id]}"
        end
    end

    private

    def match_params
        params.require(:match).permit(:teamAName, :teamBName, :venue, :teamAScore, :teamBScore, :city, :matchStatus, :matchdate, :sport, :firstRef, :secondRef, :competition)
    end
end
