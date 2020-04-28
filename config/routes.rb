Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      get :delete, on: :member
    end
  end
  namespace :admin do
    resources :roles
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # defaults to dashboard
  root :to => redirect('admin/singleview')

  # view routes
  get 'admin/singleview' => 'singleview#index'

  # api routes
  get '/api/i18n/:locale' => 'api#i18n'

end
