Rails.application.routes.draw do

devise_for :users, controllers: {
  registrations: 'users/registrations'
}

resources :users, only: [:index,:show,:edit]

resources :users do
  collection do
    get 'mypage'
  end
end

# after
root 'items#index'
resources :cards, only: [:index, :show, :new]
resources :items, only: [:index, :show, :new, :edit, :update] do

  collection do
    get 'get_category_children', defaults: {format: 'json'}
    get 'get_category_grandchildren', defaults: {format: 'json'}
  end
end

  resources :cards, only: [:index, :show, :new, :create, :destroy]





  resources :logout,only: [:index]

  resources :items do
      member do
      get 'confirm'
      get 'purchase'
      end
    end
  end