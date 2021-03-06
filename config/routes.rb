Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
    devise_for :scorers, controllers: {registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "pages#index"
    get "/my_matches", to: "matches#my_matches"
    get "/results", to: "matches#results"
    get "/api/results", to: "matches#results_api"
    patch "/match_update/:id", to: "matches#update_match_status"

    resources "subscribers"
    resources "matches" do
        resources "match_events"
    end

    mount ActionCable.server => "/cable"

end
