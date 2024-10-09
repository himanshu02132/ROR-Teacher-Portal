Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { sessions: 'sessions'}

    # Set root route to the students index page
  root to: "students#index"

    # Your other routes...
  resources :students
  resources :file_uploads do
    member do
      get :share
    end
  end

  get '/files/:tiny_url', to: 'file_uploads#show_public', as: 'file_public'
end
