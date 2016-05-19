Rails.application.routes.draw do
  # resources :controller_name --> creates six different routes in your application, all mapping to the timeline controller
  resources :timeline
  devise_for :users
  get 'home' => "pages#home"
  root "pages#index"
  get 'about' => "pages#about"

  # associate '/write' & '/comment' & '/destroy' & '/edit' to 'write' & 'comment' & 'destroy' & 'edit' action in timeline controller
  post '/write' => 'timeline#write'
  post '/comment' => 'timeline#comment'
  post '/update_post' => 'timeline#update_post'
  post '/update_comment' => 'timeline#update_comment'
  get '/view_post' => 'timeline#view_post'
  get '/edit_post' => 'timeline#edit_post'
  get '/edit_comment' => 'timeline#edit_comment'
  get '/destroy' => 'timeline#destroy'
  get '/destroy_comment' => 'timeline#destroy_comment'


  get 'portfolio' => "pages#portfolio"
  get 'sample' => "pages#sample"
  get 'contact' => "pages#contact"

end
