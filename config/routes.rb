Rails.application.routes.draw do
  root 'item_searches#new_search'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  post '/search', to: 'item_searches#search_results'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :items, only: [:index, :show, :destroy, :create]
    end
  end
end
