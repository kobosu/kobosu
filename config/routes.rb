Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to: "homes#top"
    #resources :sessions, only: [:new, :create, :destroy]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_items, only: [:update]
    resources :orders, only: [:index, :show, :update,]
    get 'orders' => 'orders#order_history', as: 'order_history'
  end
  
  scope module: :public do
    root to: "homes#top"
    get "about" =>"homes#about", as: 'about'
    resources :items, only: [:index,:show,]
    #resources :registrations, only: [:new,:create]
    #resources :sessions, only: [:new, :create, :destroy]
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :customers, only: [:edit, :update]
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    get 'customers/check' => 'customers#check', as: 'check'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show]
    post "orders/confilm" =>"orders#confilm", as: 'confilm'
    post "orders/complete" =>"orders#complete", as: 'complete'
    resources :shipping_addresses, only:[:index, :edit, :update, :destroy, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
