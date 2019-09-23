Rails.application.routes.draw do
  devise_for :users
  root to: 'builds#top'

  resources :builds do
    member do
      get 'top'
    end
  end


  resources :releases

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
