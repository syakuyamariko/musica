Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
    resources :posts, only: [:new,:index,:show,:edit,:create,:destroy,:update] do
    resource :likes, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
    resources :users, only: [:index,:show,:edit,:update,:destroy]
    resources :favorites, only: [:new,:create,:index,:show,:edit,:update]
  end
  end

