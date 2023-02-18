Rails.application.routes.draw do
 resources :campers, only: [:index, :show, :create]
end
