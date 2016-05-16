Rails.application.routes.draw do
  resources :pins
  devise_for :users
  get 'home' => "pages#home"
  root "pages#index"
  get 'index' => "pages#index"
  get 'about' => "pages#about"
  get 'timeline' => 'timeline#index'

  # associate '/write' & '/comment' & '/destroy' & '/edit' to 'write' & 'comment' & 'destroy' & 'edit' action in timeline controller
  post '/write' => 'timeline#write'
  post '/comment' => 'timeline#comment'
  post '/update_post' => 'timeline#update_post'
  post '/update_comment' => 'timeline#update_comment'
  get '/edit_post' => 'timeline#edit_post'
  get '/edit_comment' => 'timeline#edit_comment'
  get '/destroy' => 'timeline#destroy'
  get '/destroy_comment' => 'timeline#destroy_comment'


  get 'portfolio' => "pages#portfolio"
  get 'sample' => "pages#sample"
  get 'contact' => "pages#contact"

end
