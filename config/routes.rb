Rails.application.routes.draw do
 
  resources :viajeros
  resources :rallies
  resources :paquetes
  resources :paquete_contratos
  resources :agencies

  devise_for :clientes, controllers: {
    registrations: 'clientes/registrations'
  }

  resources :agencies do 
    resources :socios
  end

  get 'home/index'
  get 'test/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
