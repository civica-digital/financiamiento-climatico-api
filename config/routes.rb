Rails.application.routes.draw do
  root to: "pages#landing"
  namespace :admin do
    resources :organizations
    resources :allies
    resources :projects

    root to: "organizations#index"
  end

  devise_for :users, skip: :registrations
  devise_for :organizations, skip: :sessions
  devise_for :allies, skip: :sessions

end
