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
        get :unsubscribe
        patch :withdraw
        get :favorite
      end
    end
    resources :shops, only: [:show, :index] do
      resource :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :menus, only: [:index, :show]
      resources :seats, only: [:index, :show]
      resources :images, only: [:index, :show]
    end
  end

  namespace :restaurant do
    get "/about" => "homes#about", as: "about"
    resource :shops, only: [:show, :edit, :update] do
      collection do
        get :unsubscribe
        patch :withdraw
      end
    end
    resources :menus, only: [:create, :new, :index, :show, :edit, :update]
    resources :seats, only: [:create, :new, :index, :edit, :update, :show]
    resources :images, only: [:new, :create, :index, :show, :edit, :update, :destroy]
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
