Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do
    get 'index' => 'members#index'
    delete 'delete/:id' => 'members#destroy'
  end

  resources :data_pages
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#home'
  get 'top/mypage' => 'top#mypage'
  get 'top/about' => 'top#about'
  resources :wines do
    resources :likes, only: [:create, :destroy]
  end
  resources :likes, only: [:index]
end
