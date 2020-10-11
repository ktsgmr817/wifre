Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  devise_scope :user do
    get 'signup/step1', to: 'users/registrations#step1', as: :step1_signup_index
    get 'signup/step2', to: 'users/registrations#step2', as: :step2_signup_index
    get 'signup/step3', to: 'users/registrations#step3', as: :step3_signup_index
    post 'signup/create', to: 'users/registrations#create', as: :registration_path
    get 'signup/done', to: 'users/registrations#done', as: :done_signup_index
  end

  resources :users

  resources :users do
    member do
      get :following, :followers, :users_tweets
    end
  end
  resources :relationships, only: [:create, :destroy]

  #get "users/show" => "users#show"
  #get "users/index" => "users#index"

end
