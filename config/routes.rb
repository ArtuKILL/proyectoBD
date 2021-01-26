Rails.application.routes.draw do
 
  
  
  resources :alojamiento_hoteles
  resources :area_intereses
  resources :hist_precios
  root 'agencies#index'

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
    resources :area_intereses
    resources :paquetes, except: :index do
      resources :detalle_servicios do
        resources :alojamiento_hoteles
      end
      resources :paquete_contratos
      resources :calendario_anuales
      resources :hist_precios
      resources :paises do
        resources :ciudad_localidades do
          resources :itinerario_atracciones
          resources :atracciones
          resources :itinerarios
        end
      end
    end
  end


  get 'paquetes/index'
  get 'home/index'
  post 'agencies/crear_registro_cliente'
  post 'agencies/cerrar_sociedad'
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
