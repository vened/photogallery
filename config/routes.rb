Shikocc::Application.routes.draw do

  #resources :attachments, :only => [:show]

  resources :products, :only => [:index, :show]

  post 'add_to_cart' => 'products#add_to_cart'
  post 'empty_cart' => 'products#empty_cart'
  post 'update_quantity' => 'products#update_quantity'
  delete 'destroy_item' => 'products#destroy_item'
  get 'cart' => 'products#cart'
  get 'category/:id' => 'products#category'
  resources :feedbacks, :only => [:index, :create]


  #begin order
  get '/order/new' => 'order#new'
  post 'order/create' => 'order#create'
  get 'order/:id' => 'order#show'
  #end order

  #begin albums
  get '/photos' => 'albums#index', :as => :albums
  get '/nggallery/page-20/album-2/:id' => 'albums#show', :as => :album
  #end albums

  #begin news
  resources :news, :only => [:index, :show]
  #end news


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
