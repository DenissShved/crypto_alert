Rails.application.routes.draw do
  resources :users
  resources :alerts do
    get :current_price, on: :collection
  end

  root "alerts#index"  # optional: start with alerts page
end
