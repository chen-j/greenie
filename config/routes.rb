Rails.application.routes.draw do
  devise_for :scorers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root "pages#index"
    get "/my_matches", to: "matches#my_matches"

    resources "matches"

end
