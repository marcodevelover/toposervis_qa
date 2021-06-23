json.extract! order, :id, :folio, :reference, :date, :observation, :payment_method_id, :payment_way_id, :deleted_at, :created_at, :updated_at
json.url order_url(order, format: :json)
