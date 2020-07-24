json.extract! account, :id, :name, :description, :deleted_at, :created_at, :updated_at
json.url account_url(account, format: :json)
