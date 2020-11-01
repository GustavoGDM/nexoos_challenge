Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :users
  
  resources :index,  only: [:index]
  resources :painel,  only: [:index]
  resources :loans, only: [:new]
  resources :loan_applicants, only: [:new, :create]
  resources :simulate_loan,  only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
