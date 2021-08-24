Rails.application.routes.draw do
  
  resources :projects
  get 'bill_payment/index'
  mount Ckeditor::Engine => '/ckeditor'
  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#internal_error"  
  resources :use_of_cfdis
  namespace :admin do
    root to: "dashboard#index"
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
    get 'bill_payments', to: 'bill_payment#index', as: 'bill_payments'
    get 'bill_payments/:id/edit', to: 'bill_payment#edit', as: 'bill_payments/edit'
    get 'reports/quotations_total', to: 'reports#quotations_total', as: 'reports_quotations'
    get 'reports/quotation_services_total', to: 'reports#quotation_services_total', as: 'reports_quotation_services'
    get 'reports/service_orders_total', to: 'reports#service_orders_total', as: 'reports_service_orders'
    get 'reports/orders_total', to: 'reports#orders_total', as: 'reports_orders'
    get 'reports/sales_total', to: 'reports#sales_total', as: 'reports_sales'
    get 'reports/products_total', to: 'reports#products_total', as: 'reports_products'
    get 'reports/stocks_total', to: 'reports#stocks_total', as: 'reports_stocks'
    get 'reports/kardex', to: 'reports#kardex', as: 'reports_kardex'
    get 'reports/in_total', to: 'reports#in_total', as: 'reports_in_total'
    get 'reports/out_total', to: 'reports#out_total', as: 'reports_out_total'
    get 'reports/purchase_item', to: 'reports#purchase_item', as: 'reports_purchase_item'
    post  'quotations/:id/to_sell', :to => 'quotations#to_sell', as: :to_sell
    post  'quotation_services/:id/to_sell', :to => 'quotation_services#to_sell', as: :to_sell_services
    get  'products/new_service', to: 'products#new_service', as: 'new_service'
    get  'products/:id/edit_service', to: 'products#edit_service', as: 'edit_service'
    resources :users do
      get :delete, on: :member
      get :filter_form, on: :collection
      get :customers, on: :collection
      get :random_password, on: :collection
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
    resources :deliverables do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :currencies do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :depots do
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
    resources :conditions do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :quotations do
      get :customers, on: :collection
      get :currencies, on: :collection
      get :product_variants, on: :collection
      get :delete, on: :member
      get :filter_form, on: :collection
      get :show_from_modal, on: :member
      get :show_from_pdf, on: :member
      get :note_from_pdf, on: :member
      get :sales, on: :member
      get :bill, on: :member
      put :invoice, on: :member
      get :request_cancel_invoice, on: :member
      put :cancel_invoice, on: :member
      get :request_cancellation_state_invoice, on: :member
      put :cancellation_state_invoice, on: :member
    end
    resources :quotation_services do
      get :customers, on: :collection
      get :currencies, on: :collection
      get :product_variants, on: :collection
      get :delete, on: :member
      get :filter_form, on: :collection
      get :show_from_modal, on: :member
      get :show_from_pdf, on: :member
      get :note_from_pdf, on: :member
      get :sales, on: :member
      get :bill, on: :member
      put :invoice, on: :member
      get :request_cancel_invoice, on: :member
      put :cancel_invoice, on: :member
      get :request_cancellation_state_invoice, on: :member
      put :cancellation_state_invoice, on: :member
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
    resources :projects do
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
      get :output_pdf, on: :member
      get :note_from_pdf, on: :member
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
      get :bill, on: :member
      put :invoice, on: :member
      get :request_cancel_invoice, on: :member
      put :cancel_invoice, on: :member
      get :request_cancellation_state_invoice, on: :member
      put :cancellation_state_invoice, on: :member
      get :products_accessories, on: :collection
      get :users, on: :collection
    end
    resources :payment_ways  do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :payment_methods  do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :payment_bills  do
      get :customers, on: :collection
      get :currencies, on: :collection
      get :sales, on: :collection
      get :product_variants, on: :collection
      get :product_stocks, on: :collection
      get :delete, on: :member
      get :filter_form, on: :collection
      get :show_from_modal, on: :member
      get :show_from_pdf, on: :member
      get :bill, on: :member
      put :invoice, on: :member
      get :request_cancel_invoice, on: :member
      put :cancel_invoice, on: :member
      get :request_cancellation_state_invoice, on: :member
      put :cancellation_state_invoice, on: :member
      get :note_from_pdf, on: :member
      get :download_pdf, on: :member
      get :download_xml, on: :member
      get :download_zip, on: :member
    end
    resources :orders  do
      get :customers, on: :collection
      get :currencies, on: :collection
      get :product_variants, on: :collection
      get :product_stocks, on: :collection
      get :delete, on: :member
      get :filter_form, on: :collection
      get :show_from_modal, on: :member
      get :show_from_pdf, on: :member
      get :bill, on: :member
      put :invoice, on: :member
      get :request_cancel_invoice, on: :member
      put :cancel_invoice, on: :member
      get :request_cancellation_state_invoice, on: :member
      put :cancellation_state_invoice, on: :member
      get :note_from_pdf, on: :member
    end
    resources :sales do
      get :filter_form, on: :collection
      get :download_pdf, on: :member
      get :download_xml, on: :member
      get :download_zip, on: :member
    end
    resources :receipt_types  do
      get :delete, on: :member
      get :filter_form, on: :collection
    end
    resources :entry_codes  do
      get :delete, on: :member
      get :filter_form, on: :collection
    end

    resources :expenses do
      get :delete, on: :member
      get :filter_form, on: :collection
      get :show_from_modal, on: :member
    end
    resources :document_types
    resources :accounts
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
