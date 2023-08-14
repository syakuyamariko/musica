Rails.application.routes.draw do
  devise_for :users, skip: [:password], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :password] ,controllers: {
    sessions: "admin/sessions"
  }


  scope module: :public do

    root "homes#top"
    get "/about" => "homes#about"
    devise_scope :user do
    post "users/guest_sign_in", to: "sessions#guest_sign_in"
    end
    resources :posts, only: [:new,:index,:show,:edit,:create,:destroy,:update] do
      resource :likes, only: [:index,:create, :destroy]
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

    get "/search", to: "searches#search"

    resources :users do
      member do
    get :liked_posts
      end
    end
  end
end
