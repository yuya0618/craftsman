Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  root to: 'builds#top'

  resources :builds do
    collection do
      get 'top'
      get 'signup'
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
    resources :build_comments, only: [:create, :edit, :update, :destroy] do
      resources :build_comment_likes, only: [:create, :destroy]
    end
    resources :build_reactions, only: [:create, :destroy]
  end

  resources :releases do
    resources :release_likes, only: [:create, :destroy]
    resources :release_comments, only: [:create, :destroy]
  end

  resources :profiles, only: [:show, :edit, :update] do
    member do
      get 'mypage'
    end
  end

end
