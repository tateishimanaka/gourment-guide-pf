Rails.application.routes.draw do

  devise_for :shop, controllers: {
    sessions: 'restaurant/sessions',
    passwards: 'restaurant/passwards',
    registrations: 'restaurant/registrations'
  }

  devise_for :customer, controllers: {
    sessions: 'public/sessions',
    passwards: 'public/passwards',
    registrations: 'public/registrations'
  }

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwards: 'admin/passwards',
    registrations: 'admin/registrations'
  }

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    resource :customers, only: [:show, :edit, :update]
    get "/customer/unsubscribe" => "customers#unsubscribe"
    patch "/customer/withdraw" => "customers#withdraw"
    resources :shops, only: [:show, :index]
  end

  namespace :restaurant do
    get "/about" => "homes#about", as: "about"
    resource :shops, only: [:show, :edit, :update]
    get "shop/unsubscribe" => "shops#unsubscribe"
    patch "/shop/withdraw" => "shops#withdraw"
  end


end
