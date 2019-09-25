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
    resources :build_comments, only: [:create]
    resources :build_reactions, only: [:create]
  end

  resources :releases do
    resources :release_comments, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
