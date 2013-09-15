Shikocc::Application.routes.draw do

  root :to => 'pages#index'

  #begin albums
  resources :albums, :only => [:index, :show], :as => :albums
  #get '/photos' => 'albums#index', :as => :albums
  #get '/nggallery/page-20/album-2/:id' => 'albums#show', :as => :album
  #end albums


  get '/admin' => 'admin/dashboard#index'


  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  namespace :admin do
    resources :albums do
      collection do
        post 'upload_photo/:id' => 'albums#upload_photo', :as => :upload_photo
        delete 'delete_photo/:id' => 'albums#delete_photo', :as => :delete_photo
      end
    end
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

  resources :pages, :path => "/", :only => [:index, :show]

  get '*section/:id' => 'pages#show'

end
