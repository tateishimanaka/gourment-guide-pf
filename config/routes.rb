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


end
