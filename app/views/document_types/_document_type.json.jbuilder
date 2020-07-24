json.extract! document_type, :id, :name, :description, :deleted_at, :created_at, :updated_at
json.url document_type_url(document_type, format: :json)
