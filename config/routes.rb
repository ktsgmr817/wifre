Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'done'
    end
  end

end
