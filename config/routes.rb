Rails.application.routes.draw do
  get 'users/new'
  root 'sessions#new'
  get '/home' => "stati_pages#home"
  get '/users/:user_id/tasks/completed' => 'tasks#completed'
  resources :users do
    resources :tasks
    patch 'tasks/:id/complete' => 'tasks#complete'
  end
  post '/callback' => 'linebot#callback'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
