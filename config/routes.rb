Rails.application.routes.draw do
  resources :socios
  resources :viajeros
  resources :rallies
  resources :paquetes
  resources :paquete_contratos
  resources :agencies
  devise_for :clientes

  get 'home/index'
  get 'test/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
