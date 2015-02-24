Rails.application.routes.draw do

  resources :comments
  
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
    resources :comments
  end
  
  resources :users, only: [:index, :show]
  
  root "pins#index"
end
