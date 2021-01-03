Rails.application.routes.draw do
  devise_for :clientes
  get 'home/index'
  get 'test/index'
  root 'test#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
