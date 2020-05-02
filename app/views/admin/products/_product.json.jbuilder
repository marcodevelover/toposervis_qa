json.extract! product, :id, :name, :brand, :model, :description, :comment, :product_line_id, :unit_id, :provider_id, :accessory_id, :deleted_at, :created_at, :updated_at
json.url product_url(product, format: :json)
