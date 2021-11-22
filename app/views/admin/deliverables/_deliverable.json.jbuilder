json.extract! deliverable, :id, :name, :description, :deleted_at, :created_at, :updated_at
json.url deliverable_url(deliverable, format: :json)
