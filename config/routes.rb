require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to
  # Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the
  # :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being
  # the default of "spree".
  mount Spree::Core::Engine, at: '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  Spree::Core::Engine.add_routes do
    resources :payu, only: [:index, :create]
    resources :cookie, only: [:create]
    resources :contact_form, only: [:create]
    resources :payu_notify, only: [:create, :index]

    post 'payment_status', to: "payu#payment_status"
    get 'store_return', to: "payu#store_return"

    get "/terms-of-service", to: "tos#index", as: :tos
    get "/returns", to: "returns#index", as: :returns
    # get "/", to: "under_construction#index"
    # get "home", to: "home#index"
  end

  Spree::Core::Engine.add_routes do
    namespace :admin do
      get '/hero_images', to: 'hero_image#index', as: 'hero_images'
      get '/hero_images/new', to: 'hero_image#new', as: 'new_hero_image'
      get '/hero_images/:id', to: 'hero_image#view', as: 'view_hero_image'
      post '/hero_images', to: 'hero_image#create', as: 'create_hero_image'
      delete '/hero_images/:id', to: 'hero_image#destroy', as: 'delete_hero_image'
    end
  end
end
