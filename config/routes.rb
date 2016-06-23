Rails.application.routes.draw do
  namespace :admin do
    resources :organizations
    resources :projects

    root to: "organizations#index"
  end

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
