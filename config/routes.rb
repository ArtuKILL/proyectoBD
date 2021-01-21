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
  root 'agencies#index'
  post 'agencies/crear_registro_cliente'
  get 'agencies/:id', to: 'agencies#crear_registro_cliente'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
