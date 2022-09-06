Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  scope module: :home do
    resource :user
    resource :login
  end
  resources :user do
    resources :mypage
    namespace :mypage do
      resources :money_box
    end
  end
  namespace :mypage do
    resources :money_boxes do
      resources :payeds
    end
  end
  namespace :manages do
    resources :life_manages
  end
end
