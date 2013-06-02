Shikocc::Application.routes.draw do

  #resources :attachments, :only => [:show]

  resources :products, :only => [:index, :show]

  post 'add_to_cart' => 'products#add_to_cart'
  post 'empty_cart' => 'products#empty_cart'
  post 'update_quantity' => 'products#update_quantity'
  delete 'destroy_item' => 'products#destroy_item'
  get 'cart' => 'products#cart'
  resources :feedbacks, :only => [:index, :create]
  resources :order, :only => [:index]


  get '/admin' => 'admin/dashboard#index'


  get 'home' => 'pages#home'
  get 'page1' => 'pages#page1'
  get 'page2' => 'pages#page2'
  get 'page3' => 'pages#page3'


  resources :pages, :path => "/", :only => [:index, :show]
  root :to => 'pages#index'


  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  namespace :admin do
    resources :pages do
      collection do

        post :rebuild

        get ':id/edit' => 'pages#edit'
        get '*section/:id/edit' => 'pages#edit'

        get ':id' => 'pages#show'
        get '*section/:id' => 'pages#show'

        get ':id' => 'pages#new'

        put '*section/:id' => 'pages#update'
        put ':id' => 'pages#update'

        delete ':id' => 'pages#destroy'
        delete '*section/:id' => 'pages#destroy'

      end
    end
  end


  get '*section/:id' => 'pages#show'
end
