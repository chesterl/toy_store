Rails.application.routes.draw do
  resources :messages, only: [:new, :create, :index]
  get "/crazy_things", to: "admin#crazy_things"
  get "/do_crazy_things", to: "admin#do_crazy_things"
  resources :orders, only: [:index, :show, :create]
  get "/sales", to: "orders#sales"
  resources :toys do
    get "search", on: :collection
  end
  root "dashboard#index"
  get "dashboard/index"
  resources :sellers, except: :destroy

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
