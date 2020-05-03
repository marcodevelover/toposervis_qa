json.extract! customer, :id, :name, :rfc, :business_name, :created_at, :updated_at
json.url customer_url(customer, format: :json)
