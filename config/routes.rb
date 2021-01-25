Rails.application.routes.draw do
 
  root 'agencies#index'

  resources :viajeros
  resources :rallies
  resources :paquete_contratos
  resources :agencies

  devise_for :clientes, controllers: {
    registrations: 'clientes/registrations'
  }

  resources :paquetes 

  resources :agencies do 
    resources :socios,param: :fecha_inicial
    resources :paquetes, except: :index do 
      resources :paquete_contratos
    end
  end


  get 'paquetes/index'
  get 'home/index'
  post 'agencies/crear_registro_cliente'
  post 'agencies/cerrar_sociedad'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
