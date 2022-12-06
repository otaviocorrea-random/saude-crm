require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  root to: "auth#login"

  resources :municipes
  resources :municipios

  mount Sidekiq::Web => '/sidekiq'
end
