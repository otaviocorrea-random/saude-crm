Rails.application.routes.draw do
  root to: "auth#login"

  resources :municipes
  resources :municipios
end
