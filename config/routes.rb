Rails.application.routes.draw do
  
  namespace :admin do
    resources :users do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :providers do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :customers do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :accessories do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :currencies do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :units do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :product_lines do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :products do
      get :delete, on: :member
      get :filter_form, on: :collection
      get :add_accessory, on: :member
    end
    resources :product_variants
    resources :category_types do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :category_types do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :categories do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :subcategories do
      get :delete, on: :member
      get :filter_form, on: :collection
      get :categories, on: :collection
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
