Rails.application.routes.draw do
  resources :candidates
  devise_for :users
  root 'candidates#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
