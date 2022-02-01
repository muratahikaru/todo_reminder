Rails.application.routes.draw do
  root 'sessions#new'
  get '/home' => "stati_pages#home"
  resources :users do
    resources :tasks
    patch 'tasks/:id/complete' => 'tasks#complete'
  end
  post '/callback' => 'linebot#callback'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
