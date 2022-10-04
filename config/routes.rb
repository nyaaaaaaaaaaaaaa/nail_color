Rails.application.routes.draw do

  root to: 'public/homes#top'

  #get '/admin' => '/admin/sessions#new'

  ## devise_for :admins
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  ## devise_for :customers
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

  #ゲストログイン機能
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


  ## 追加
  namespace :admin do
    #get '/admin/sign_in' => 'admin/sessions#new', as: 'admin/sign_in'
    resources :comments, only: [:edit, :index]
    resources :customers, only: [:index, :show]
    resources :items, only: [:index, :show] do
      resources :comments, only: [:index, :edit, :update, :destroy]
    end
    resources :tags, only: [:index, :new, :edit, :create, :update, :destroy]
  end

  scope module: :public do
    get '/customers/my_page' => 'customers#show', as: 'customers/my_page'
    get '/customers/commentsindex' => 'customers#commentsindex', as: 'customers_commentsindex'
    get '/customers/information/edit' => 'customers#edit', as: 'customers/information/edit'
    patch '/customers/information/edit' => 'customers#update'
    get '/customers/information' => 'customers#update', as: 'update_information'
    patch '/customers/information' => 'customers#update'
    get '/customers/itemsindex' => 'customers#itemsindex', as: 'customers_itemsindex'
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'customers_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'#, as: 'customers_withdraw'
    resources :items, only: [:edit, :index, :new, :show, :create, :update, :destroy] do
      resources :comments, only: [:index, :new, :edit, :create, :update, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :favorites, only: [:index]
    resources :tags, only: [:index]
    resources :customers do
      resource :favorites, only: [:index]
    end
    #resources :customers, only: [:edit, :new, :show, :create, :update, :destroy]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
