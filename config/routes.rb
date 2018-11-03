# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, path: 'a', controllers: { sessions: 'sessions' }

  devise_scope :admin do
    namespace :admin, path: 'a' do
      authenticated :admin do
        root 'admin#index'
        get '/admin', to: 'admin#index', as: 'dashboard'
        get '/a/sign_out', to: 'devise/sessions#destroy', as: :delete
        resources :students
        resources :groups
        resources :attendances
        resources :subjects
        resources :teachers
      end
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
