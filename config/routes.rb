Rails.application.routes.draw do
  devise_for :users
  # ログアウト
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :user do
    resources :mypage
  end
  namespace :manages do
    resources :life_manages
  end
end
