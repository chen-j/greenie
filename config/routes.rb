Rails.application.routes.draw do
  devise_for :scorers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root "pages#index"

    resources "matches"

end
