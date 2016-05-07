Rails.application.routes.draw do
  resources :pins
  devise_for :users
  get 'home' => "pages#home"
  root "pages#home"
  get 'about' => "pages#about"
  get 'timeline' => 'timeline#index'

  # associate /write & /comment to 'write' & 'comment' action in timeline controller
  post '/write' => 'timeline#write'
  post '/comment' => 'timeline#comment'

  get 'portfolio' => "pages#portfolio"
  get 'sample' => "pages#sample"
  get 'contact' => "pages#contact"

end
