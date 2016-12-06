class SubscribersController < ApplicationController

    before_filter :authenticate_scorer!

    def new
    end

    def update
        token = params[:stripeToken]
        customer = Stripe::Customer.create(
            card:token,
            plan:1010,
            email: current_scorer.email
        )

        current_scorer.subscribed = true
        current_scorer.stripeid = customer.id

        redirect_to "/my_matches"
    end

end
