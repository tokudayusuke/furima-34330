Rails.application.routes.draw do
<<<<<<< Updated upstream
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
  devise_for :users
  root to: "furimas#index"
  resources :furimas, only: [:index, :new, :create]
>>>>>>> Stashed changes
end
