Rails.application.routes.draw do
  resources :orders, only: [:index, :show, :create]
  resources :toys do
    get "search", on: :collection
  end
  root "dashboard#index"
  get "dashboard/index"
  resources :sellers, except: :destroy

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
