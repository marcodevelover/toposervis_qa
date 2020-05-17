json.extract! service_order, :id, :date_admission, :customer_id, :product_id, :serie, :brand, :model, :observation, :deleted_at, :status, :created_at, :updated_at
json.url service_order_url(service_order, format: :json)
