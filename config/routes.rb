Rails.application.routes.draw do

  get 'inquiry/index'
  get 'inquiry/confirm'
  get 'inquiry/thanks'
  get 'searches/search'
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
    resource :customers, only: [:show, :edit, :update] do
      collection do
        get :favorite
      end
    end
    get "/customer/unsubscribe" => "customers#unsubscribe"
    patch "/customer/withdraw" => "customers#withdraw"
    resources :shops, only: [:show, :index] do
      resource :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :menus, only: [:show, :index]
  end

  namespace :restaurant do
    get "/about" => "homes#about", as: "about"
    resource :shops, only: [:show, :edit, :update]
    get "shop/unsubscribe" => "shops#unsubscribe"
    patch "/shop/withdraw" => "shops#withdraw"
    resources :menus, only: [:create, :new, :index, :show, :edit, :uodate]
  end

  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index]
    resources :shops, only: [:index]
  end

  get "search" => "searches#search"

  get 'inquiry' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'

end
