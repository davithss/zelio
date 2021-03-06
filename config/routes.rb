# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  namespace :admin, path: 'a' do
    authenticated :admin do
      root 'dashboard#index'
      get '/dashboard', to: 'dashboard#index', as: 'dashboard'
      get '/a/sign_out', to: 'devise/sessions#destroy', as: :delete
      resources :students
      resources :klasses do
        resources :attendances, controller: '/admin/attendances'
        get 'disable_student', to: 'klasses#disable_student'
        get 'disable', to: 'klasses#disable'
        get 'absences/:student_id', to: 'klasses#absences', as: :absences
      end
      # resources :situations
      resources :teachers
      resources :justifications, except: %i[new create]
    end
  end

  namespace :student, path: 's' do
    authenticated :student do
      get '/dashboard', to: 'dashboard#index', as: 'dashboard'
      resources :justifications, only: %i[index show new create]
    end
  end

  devise_for :students, path: 's', controllers: { sessions: 'sessions',
                                                  registrations: 'registrations',
                                                  confirmations: 'student/confirmation' }
  devise_for :admins, path: 'a', controllers: { sessions: 'sessions',
                                                registrations: 'registrations'}
end
