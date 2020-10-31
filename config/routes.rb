Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :users
  
  get 'painel/index'
  get 'home/index'
  resources :loans, only: [:new,]
  resources :loan_applicants, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
