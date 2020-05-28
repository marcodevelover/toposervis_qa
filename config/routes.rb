Rails.application.routes.draw do
  
  namespace :admin do
    root to: "dashboard#index"
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
    get 'reports/quotations_total', to: 'reports#quotations_total', as: 'reports_quotations'
    get 'reports/service_orders_total', to: 'reports#service_orders_total', as: 'reports_service_orders'
    get 'reports/orders_total', to: 'reports#orders_total', as: 'reports_orders'
    get 'reports/sales_total', to: 'reports#sales_total', as: 'reports_sales'
    get 'reports/products_total', to: 'reports#products_total', as: 'reports_products'
    resources :users do
      get :delete, on: :member
      get :filter_form, on: :collection
      get :customers, on: :collection
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
    resources :type_service_orders do
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
    resources :diagnosis_types do
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
    resources :conditions
    resources :quotations do
      get :customers, on: :collection
      get :currencies, on: :collection
      get :product_variants, on: :collection
      get :delete, on: :member
      get :filter_form, on: :collection
      get :show_from_modal, on: :member
      get :show_from_pdf, on: :member
      get :sales, on: :member
    end
    resources :purchases do
      get :providers, on: :collection
      get :currencies, on: :collection
      get :product_variants, on: :collection
      get :delete, on: :member
      get :filter_form, on: :collection
      get :show_from_modal, on: :member
      get :show_from_pdf, on: :member
    end    
    resources :diagnoses do
      get :show_from_pdf, on: :member
    end
    resources :service_orders do
      get :delete, on: :member
      get :output, on: :member
      put :delivered, on: :member
      get :filter_form, on: :collection
      get :customers, on: :collection
      get :products, on: :collection
      get :show_from_modal, on: :member
      get :show_from_pdf, on: :member
      get :diagnoses, on: :member
      get :product_variants, on: :collection
      get :sales, on: :member
    end
    resources :payment_ways  do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :payment_methods  do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :orders  do
      get :customers, on: :collection
      get :currencies, on: :collection
      get :product_variants, on: :collection
      get :delete, on: :member
      get :filter_form, on: :collection
      get :show_from_modal, on: :member
      get :show_from_pdf, on: :member
    end
    resources :sales do
      get :filter_form, on: :collection
    end
    resources :receipt_types  do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :entry_codes  do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    #resources :diagnoses
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
