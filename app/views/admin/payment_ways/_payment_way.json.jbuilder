json.extract! payment_way, :id, :name, :description, :deleted_at, :created_at, :updated_at
json.url payment_way_url(payment_way, format: :json)
