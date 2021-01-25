Rails.application.routes.draw do
 
  
  resources :calendario_anuales
  resources :viajeros
  resources :rallies
  resources :paquete_contratos
  resources :agencies

  devise_for :clientes, controllers: {
    registrations: 'clientes/registrations'
  }

  resources :paquetes do
    
    
  end


  resources :agencies do 
    resources :socios, param: :fecha_inicial
    resources :paquetes, except: :index do
      resources :detalle_servicios
      resources :paquete_contratos
      resources :calendario_anuales
    end
  end

  post '/agencies/:agency_id/paquetes/:paquete_id/paquete_contratos'

  get 'paquetes/index'
  get 'home/index'
  get 'test/index'
  root 'agencies#index'
  post 'agencies/crear_registro_cliente'
  post 'agencies/cerrar_sociedad'
  #get 'agencies/:id', to: 'agencies#crear_registro_cliente'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
