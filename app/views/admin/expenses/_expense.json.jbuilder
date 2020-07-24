json.extract! expense, :id, :date, :payment_method_id, :purchase_order, :last_digit, :project, :account_id, :category_type_id, :category_id, :provider_id, :document_type_id, :folio, :comment, :concept, :deleted_at, :created_at, :updated_at
json.url expense_url(expense, format: :json)
