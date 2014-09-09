#Rails.application.routes.draw do
  devise_for :users
Bloccit::Application.routes.draw do

  devise_for :users
  resources :posts


  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
