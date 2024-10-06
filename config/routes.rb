# config/routes.rb
Rails.application.routes.draw do
  devise_for :doctors
  root 'sessions#new'

  get 'register', to: 'users#new'
  post 'register', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'receptionist_dashboard', to: 'patients#index'
  get 'doctor_dashboard', to: 'doctors#doctor_dashboard'
  get 'admins_dashboard', to: 'admins#dashboard'

  resources :patients

  # Custom route for adding a new patient in receptionist_dashboard
  get 'receptionist_dashboard/new_patient', to: 'patients#new_patient', as: 'new_patient_in_receptionist_dashboard'
end