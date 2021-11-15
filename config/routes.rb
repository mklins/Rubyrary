Rails.application.routes.draw do

  root 'books#index'
  
  resources :books

  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create edit update]

  namespace :admin do
    resources :users, only: %i[index create edit update destroy]

    resources :authors, only: %i[index new create edit update]
  end

end
