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
  end

  resources :releases

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
