Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get 'signup/step1', to: 'users/registrations#step1', as: :step1_signup_index
    get 'signup/step2', to: 'users/registrations#step2', as: :step2_signup_index
    get 'signup/step3', to: 'users/registrations#step3', as: :step3_signup_index
    post 'signup/create', to: 'users/registrations#create', as: :registration_path
    get 'signup/done', to: 'users/registrations#done', as: :done_signup_index
  end

  get "users/show" => "users#show"

  #resources :signup do
  #  collection do
  #    get 'step1'
  #    get 'step2'
  #    get 'step3'
  #    get 'done'
  #  end
  #end

end
