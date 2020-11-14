Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  resources :data_pages
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#home'
  get 'top/mypage' => 'top#mypage'
  get 'top/about' => 'top#about'
  resources :wines
end
