Rails.application.routes.draw do
  resources :pins
  devise_for :users
  get 'home' => "pages#home"
  root "pages#home"
  get 'about' => "pages#about"
  get 'portfolio' => "pages#portfolio"
  get 'sample' => "pages#sample"
end

