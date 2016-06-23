Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: "users#index"
  end

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
