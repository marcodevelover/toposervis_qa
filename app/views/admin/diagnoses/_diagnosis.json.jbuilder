json.extract! diagnosis, :id, :service_order_id, :date, :delivery_time, :date_delivery, :diagnosis_type_id, :created_at, :updated_at
json.url diagnosis_url(diagnosis, format: :json)
