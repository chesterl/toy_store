Rails.application.routes.draw do
  resources :toys
  root "dashboard#index"
  get "dashboard/index"
  resources :sellers, except: :destroy

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
