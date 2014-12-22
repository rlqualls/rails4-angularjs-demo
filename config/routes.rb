Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'application#index'

  resources :products do
    resources :comments
  end


  namespace :api do
    namespace :v1 do
      resources :products, except: :edit do
        resources :comments, except: :edit
      end
      resources :comments, except: :edit
    end
  end
end
