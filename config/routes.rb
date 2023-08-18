Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/registrations',
    sessions: 'devise/sessions'
  }
 
   devise_scope :user do
    authenticated do
    root to: 'groups#index', as: 'user'
    end
    unauthenticated do
      root to: 'pages#home', as: 'unauthenticated_root'
    end
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  # root 'pages#home'
  # get 'pages/home', to: 'pages#home'
  resources :users, only: [:index, :show] do
    resources :groups
    resources :entities
  end
end
