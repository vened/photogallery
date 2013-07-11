Shikocc::Application.routes.draw do

  root :to => 'pages#index'

  post 'add_to_cart' => 'products#add_to_cart'
  post 'empty_cart' => 'products#empty_cart'
  post 'update_quantity' => 'products#update_quantity'
  delete 'destroy_item' => 'products#destroy_item'
  get 'cart' => 'products#cart'
  get 'search' => 'products#search'

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

  #begin ajax
  get '/ajax/cart' => 'ajax#cart'
  get '/ajax/cart_price' => 'ajax#cart_price'
  get '/ajax/mini_cart' => 'ajax#mini_cart'
  #end ajax


  #begin news
  resources :news, :only => [:index, :show]
  #end news


  get '/admin' => 'admin/dashboard#index'

  #begin static pages
  get 'contacts' => 'pages#contacts'
  get 'about' => 'pages#about'
  #end static pages


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

  #begin хаки для страниц из-за ёбнутейшего роутинга ниже
  get '/service/:id' => 'pages#show'
  #end хаки для страниц из-за ёбнутейшего роутинга ниже


  #ёбнутейший роутинг начало
  get '/internet-magazin' => 'categories#index', :as => :products
  get '/shop/' => 'categories#index', :as => :shop
  get '/shop/:id' => 'categories#category', :as => :category
  resources :categories, :only => [], :path => '/' do
    get '/:id' => 'products#show', :as => :product
  end
  #/tartaletki/rolly-iz-norvezhskoj-semgi-sobstvennogo-posola-s-syrom-filadelfiya/
  #ёбнутейший роутинг конец

  resources :pages, :path => "/", :only => [:index, :show]

  get '*section/:id' => 'pages#show'

end
