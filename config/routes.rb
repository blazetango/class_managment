Rails.application.routes.draw do
  resources :months
  resources :expenses
  resources :transactions
  resources :centers
  resources :instruments
  resources :fees
  resources :students
  resources :batches
  resources :attendences
   get 'generate_attendence', to: 'attendences#generate_attendence'
   put 'update_attendance', to: 'attendences#update_attendance'
  devise_for :users
  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end
  root :to => 'batches#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
