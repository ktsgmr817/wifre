Rails.application.routes.draw do
  root 'static_pages#home'
  get '/other', to: 'users#other'
  get '/kiyaku', to: 'static_pages#kiyaku'
  get '/privacy', to: 'static_pages#privacy'

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  devise_scope :user do
    get 'signup/step1', to: 'users/registrations#step1', as: :step1_signup_index
    get 'signup/step2', to: 'users/registrations#step2', as: :step2_signup_index
    get 'signup/step3', to: 'users/registrations#step3', as: :step3_signup_index
    post 'signup/create', to: 'users/registrations#create', as: :registration_path
    get 'signup/done', to: 'users/registrations#done', as: :done_signup_index
  end

  resources :users do
    collection do
      get :commonphasefirst
      post :commonphasefirst, to: 'users#create_commonphasefirst'
      get :commonphasesecond
      post :commonphasesecond, to: 'users#create_commonphasesecond'
      get :commonphasethird
      post :commonphasethird, to: 'users#create_commonphasethird'
    end
  end

  resources :users

  resources :users do
    member do
      get :following, :followers, :users_tweets
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]


  resources :relationships, only: [:create, :destroy]

end
