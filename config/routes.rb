Rails.application.routes.draw do
  devise_for :users, skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :password] ,controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    get "search" => "searches#search"
  end


  scope module: :public do

    root "homes#top"
    get "/about" => "homes#about"
    devise_scope :user do
    post "users/guest_sign_in", to: "sessions#guest_sign_in"
    end
    resources :posts, only: [:new,:create,:index,:show,:edit,:update,:destroy] do
      resource :likes, only: [:create,:index, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end

    get 'users/confirm_withdraw' => 'users#confirm_withdraw'
    patch '/users/withdraw' => 'users#withdraw'
    resources :users, only: [:index,:show,:edit,:update,:destroy] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :favorites, only: [:new,:create,:index,:show,:edit,:update,:destroy] do
      resource :likes, only: [:index, :create, :destroy]
    end



    resources :messages, only: [:create]
    resources :rooms, only: [:create,:show]
    get "/search", to: "searches#search"

    resources :users do
      member do
    get :liked_posts
      end
    end
  end
end
