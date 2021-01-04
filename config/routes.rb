Rails.application.routes.draw do
  resources :agencies
  get 'home/index'
  get 'test/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
