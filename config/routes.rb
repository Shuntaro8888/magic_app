Rails.application.routes.draw do
  root 'static_pages#home'  # Root path of the application
  get '/help', to: 'static_pages#help'  # Help page
  get '/about', to: 'static_pages#about'  # About page
  get '/contact', to: 'static_pages#contact'  # Contact page
  get '/signup', to: 'users#new'  # Signup page
  get '/login', to: 'sessions#new'  # Login page
  post '/login', to: 'sessions#create'  # Create session (login)
  delete '/logout', to: 'sessions#destroy'  # Logout action
  resources :users  # RESTful routes for users
end