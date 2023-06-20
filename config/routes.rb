Rails.application.routes.draw do
  get 'order_items/update'
  get 'orders/show'
  get 'orders/update'
  get 'customers/index'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'genres/index'
  get 'genres/create'
  get 'genres/edit'
  get 'genres/update'
  get 'items/index'
  get 'items/new'
  get 'items/create'
  get 'items/show'
  get 'items/edit'
  get 'items/update'
  get 'shipping_addresses/index'
  get 'shipping_addresses/edit'
  get 'shipping_addresses/create'
  get 'shipping_addresses/update'
  get 'shipping_addresses/destroy'
  get 'orders/new'
  get 'orders/confilm'
  get 'orders/complete'
  get 'orders/create'
  get 'orders/index'
  get 'orders/show'
  get 'cart_items/index'
  get 'cart_items/update'
  get 'cart_items/destroy'
  get 'cart_items/destroy_all'
  get 'cart_items/create'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/check'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'registrations/new'
  get 'registrations/create'
  get 'items/index'
  get 'items/show'
  get 'homes/top'
  get 'homes/about'
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
