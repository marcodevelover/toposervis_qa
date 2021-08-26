# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_26_153906) do

  create_table "accessories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activity_descriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "diagnosis_id", null: false
    t.text "description"
    t.integer "created_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diagnosis_id"], name: "index_activity_descriptions_on_diagnosis_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "category_type_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_type_id"], name: "index_categories_on_category_type_id"
  end

  create_table "category_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ckeditor_assets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "default"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "is_for"
  end

  create_table "currencies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "abbreviation"
    t.decimal "exchange_rate", precision: 18, scale: 6
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "crossing"
    t.string "postcode"
    t.string "colony"
    t.string "town"
    t.string "state"
    t.string "country"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "interior_number"
    t.index ["customer_id"], name: "index_customer_addresses_on_customer_id"
  end

  create_table "customer_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "beneficiary"
    t.string "account"
    t.string "clabe"
    t.string "bank_name"
    t.string "currency"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_customer_banks_on_customer_id"
  end

  create_table "customer_contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.string "phone"
    t.string "extension"
    t.string "cellphone"
    t.string "email"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_customer_contacts_on_customer_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "rfc"
    t.string "business_name"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deliverables", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "depots", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "default"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_sale", default: false
  end

  create_table "diagnoses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "service_order_id", null: false
    t.datetime "date"
    t.string "delivery_time"
    t.datetime "date_delivery"
    t.decimal "subtotal", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_tax"
    t.boolean "is_done"
    t.integer "currency_id"
    t.boolean "is_authorized"
    t.index ["service_order_id"], name: "index_diagnoses_on_service_order_id"
  end

  create_table "diagnoses_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "diagnosis_id", null: false
    t.bigint "diagnosis_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diagnosis_id"], name: "index_diagnoses_types_on_diagnosis_id"
    t.index ["diagnosis_type_id"], name: "index_diagnoses_types_on_diagnosis_type_id"
  end

  create_table "diagnosis_descriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "diagnosis_id", null: false
    t.text "description"
    t.integer "created_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diagnosis_id"], name: "index_diagnosis_descriptions_on_diagnosis_id"
  end

  create_table "diagnosis_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "document_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entry_codes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expense_amounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "expense_id", null: false
    t.decimal "total", precision: 18, scale: 6
    t.decimal "iva", precision: 18, scale: 6
    t.decimal "ieps", precision: 18, scale: 6
    t.decimal "total_with_tax", precision: 18, scale: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_id"], name: "index_expense_amounts_on_expense_id"
  end

  create_table "expenses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date"
    t.bigint "payment_method_id", null: false
    t.string "purchase_order"
    t.string "last_digit"
    t.string "project"
    t.bigint "account_id", null: false
    t.bigint "category_type_id", null: false
    t.bigint "category_id", null: false
    t.bigint "provider_id", null: false
    t.bigint "document_type_id", null: false
    t.string "folio"
    t.text "comment"
    t.string "concept"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_expenses_on_account_id"
    t.index ["category_id"], name: "index_expenses_on_category_id"
    t.index ["category_type_id"], name: "index_expenses_on_category_type_id"
    t.index ["document_type_id"], name: "index_expenses_on_document_type_id"
    t.index ["payment_method_id"], name: "index_expenses_on_payment_method_id"
    t.index ["provider_id"], name: "index_expenses_on_provider_id"
  end

  create_table "institurion_statuses", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "id"
    t.text "name"
    t.text "description"
    t.text "deleted_at"
    t.text "created_at"
    t.text "updated_at"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "record_type"
    t.bigint "record_id"
    t.bigint "product_variant_id", null: false
    t.string "name"
    t.text "extended_description"
    t.string "unit"
    t.decimal "quantity", precision: 18, scale: 4
    t.decimal "unit_price", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.string "currency"
    t.decimal "cost_price", precision: 18, scale: 6
    t.decimal "tax_item_total", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "serial_number"
    t.index ["product_variant_id"], name: "index_items_on_product_variant_id"
    t.index ["record_type", "record_id"], name: "index_items_on_record_type_and_record_id"
  end

  create_table "lending_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "product_variant_id", null: false
    t.string "name"
    t.integer "quantity"
    t.decimal "unit_price", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.string "currency"
    t.decimal "cost_price", precision: 18, scale: 6
    t.decimal "tax_item_total", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6
    t.string "number_serie"
    t.string "number_procedure"
    t.string "number_part"
    t.text "observation"
    t.string "unit"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_variant_id"], name: "index_lending_items_on_product_variant_id"
    t.index ["record_type", "record_id"], name: "index_lending_items_on_record_type_and_record_id"
  end

  create_table "lendings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "folio"
    t.string "name"
    t.string "description"
    t.string "responsible"
    t.datetime "date"
    t.text "observation"
    t.decimal "subtotal", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.decimal "tax_item_total", precision: 18, scale: 6
    t.string "state"
    t.datetime "validity"
    t.bigint "currency_id", null: false
    t.decimal "exchange_rate", precision: 18, scale: 6
    t.bigint "receipt_type_id", null: false
    t.bigint "entry_code_id", null: false
    t.bigint "provider_id", null: false
    t.integer "created_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_lendings_on_currency_id"
    t.index ["entry_code_id"], name: "index_lendings_on_entry_code_id"
    t.index ["provider_id"], name: "index_lendings_on_provider_id"
    t.index ["receipt_type_id"], name: "index_lendings_on_receipt_type_id"
  end

  create_table "order_accessories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "service_order_id", null: false
    t.string "accessory"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_order_id"], name: "index_order_accessories_on_service_order_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "folio"
    t.datetime "date"
    t.text "observation"
    t.decimal "subtotal", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.decimal "tax_item_total", precision: 18, scale: 6
    t.string "state"
    t.datetime "validity"
    t.bigint "currency_id", null: false
    t.decimal "exchange_rate", precision: 18, scale: 6
    t.bigint "customer_id", null: false
    t.text "condition"
    t.integer "created_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_tax"
    t.index ["currency_id"], name: "index_orders_on_currency_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "orders_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "service_order_id", null: false
    t.bigint "type_service_order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_order_id"], name: "index_orders_types_on_service_order_id"
    t.index ["type_service_order_id"], name: "index_orders_types_on_type_service_order_id"
  end

  create_table "payment_bills", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "sale_id"
    t.integer "payment_method_id"
    t.integer "payment_way_id"
    t.integer "exchange_type_id"
    t.datetime "deleted_at"
    t.decimal "total_amount", precision: 18, scale: 6
    t.datetime "payment_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "partiality_number"
    t.decimal "previous_balance_amount", precision: 18, scale: 6
    t.decimal "amount_paid", precision: 18, scale: 6
    t.decimal "unpaid_balance_amount", precision: 18, scale: 6
    t.string "bill_key"
    t.string "bill_state"
    t.string "cancellation_state"
    t.string "uuid"
    t.string "bill_folio"
  end

  create_table "payment_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "payment_method_key"
  end

  create_table "payment_ways", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "payment_way_key"
  end

  create_table "payments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.integer "payment_method_id"
    t.integer "payment_way_id"
    t.integer "exchange_type_id"
    t.decimal "total_amount", precision: 18, scale: 6
    t.datetime "payment_date"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "partiality_number"
    t.decimal "previous_balance_amount", precision: 18, scale: 6
    t.decimal "amount_paid", precision: 18, scale: 6
    t.decimal "unpaid_balance_amount", precision: 18, scale: 6
    t.index ["record_type", "record_id"], name: "index_payments_on_record_type_and_record_id"
  end

  create_table "product_lines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "product_variant_id"
    t.string "serial_number"
    t.integer "created_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
  end

  create_table "product_variant_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_variant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_variant_id"], name: "index_product_variant_images_on_product_variant_id"
  end

  create_table "product_variants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.string "code_alternative"
    t.string "stocking_time"
    t.decimal "cost_price", precision: 10, scale: 2
    t.bigint "currency_id", null: false
    t.decimal "amount_public", precision: 10, scale: 2
    t.decimal "amount_provider", precision: 10, scale: 2
    t.decimal "amount_shipping", precision: 10, scale: 2
    t.integer "stock_min"
    t.integer "stock_max"
    t.bigint "product_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "product_key"
    t.string "product_description"
    t.boolean "is_service_order"
    t.string "location"
    t.string "execution_time"
    t.decimal "depreciation", precision: 18, scale: 6
    t.boolean "is_supplies", default: false
    t.index ["currency_id"], name: "index_product_variants_on_currency_id"
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "model"
    t.text "description"
    t.string "comment"
    t.bigint "product_line_id", null: false
    t.bigint "unit_id", null: false
    t.bigint "provider_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_service_order"
    t.boolean "required_serial_number"
    t.boolean "available_for_sale"
    t.boolean "is_service"
    t.index ["product_line_id"], name: "index_products_on_product_line_id"
    t.index ["provider_id"], name: "index_products_on_provider_id"
    t.index ["unit_id"], name: "index_products_on_unit_id"
  end

  create_table "products_accessories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "accessory_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accessory_id"], name: "index_products_accessories_on_accessory_id"
    t.index ["product_id"], name: "index_products_accessories_on_product_id"
  end

  create_table "products_deliverables", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "deliverable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deliverable_id"], name: "index_products_deliverables_on_deliverable_id"
    t.index ["product_id"], name: "index_products_deliverables_on_product_id"
  end

  create_table "project_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "product_variant_id", null: false
    t.string "name"
    t.integer "quantity"
    t.decimal "unit_price", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.string "currency"
    t.decimal "cost_price", precision: 18, scale: 6
    t.decimal "tax_item_total", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6
    t.string "number_serie"
    t.string "number_procedure"
    t.string "number_part"
    t.text "observation"
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_variant_id"], name: "index_project_items_on_product_variant_id"
    t.index ["record_type", "record_id"], name: "index_project_items_on_record_type_and_record_id"
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "folio"
    t.string "name"
    t.string "description"
    t.datetime "date"
    t.text "observation"
    t.decimal "subtotal", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.decimal "tax_item_total", precision: 18, scale: 6
    t.string "state"
    t.datetime "validity"
    t.bigint "currency_id"
    t.decimal "exchange_rate", precision: 18, scale: 6
    t.bigint "receipt_type_id"
    t.bigint "entry_code_id"
    t.bigint "provider_id"
    t.integer "created_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_projects_on_currency_id"
    t.index ["entry_code_id"], name: "index_projects_on_entry_code_id"
    t.index ["provider_id"], name: "index_projects_on_provider_id"
    t.index ["receipt_type_id"], name: "index_projects_on_receipt_type_id"
  end

  create_table "provider_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "crossing"
    t.string "postcode"
    t.string "colony"
    t.string "town"
    t.string "state"
    t.string "country"
    t.bigint "provider_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider_id"], name: "index_provider_addresses_on_provider_id"
  end

  create_table "provider_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "beneficiary"
    t.string "account"
    t.string "clabe"
    t.string "bank_name"
    t.string "currency"
    t.bigint "provider_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider_id"], name: "index_provider_banks_on_provider_id"
  end

  create_table "provider_contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.string "phone"
    t.string "extension"
    t.string "cellphone"
    t.string "email"
    t.bigint "provider_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider_id"], name: "index_provider_contacts_on_provider_id"
  end

  create_table "providers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "rfc"
    t.string "business_name"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchase_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "record_type"
    t.bigint "record_id"
    t.bigint "product_variant_id", null: false
    t.string "name"
    t.integer "quantity"
    t.decimal "unit_price", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.string "currency"
    t.decimal "cost_price", precision: 18, scale: 6
    t.decimal "tax_item_total", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6
    t.string "number_serie"
    t.string "number_procedure"
    t.string "number_part"
    t.text "observation"
    t.text "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "product_state", default: "credit"
    t.integer "depot_id", default: 1
    t.index ["product_variant_id"], name: "index_purchase_items_on_product_variant_id"
    t.index ["record_type", "record_id"], name: "index_purchase_items_on_record_type_and_record_id"
  end

  create_table "purchases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "folio"
    t.datetime "date"
    t.text "observation"
    t.decimal "subtotal", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.decimal "tax_item_total", precision: 18, scale: 6
    t.string "state"
    t.datetime "validity"
    t.bigint "currency_id", null: false
    t.decimal "exchange_rate", precision: 18, scale: 6
    t.bigint "receipt_type_id", null: false
    t.bigint "entry_code_id", null: false
    t.bigint "provider_id", null: false
    t.integer "created_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code_invoice"
    t.integer "payment_way_id"
    t.index ["currency_id"], name: "index_purchases_on_currency_id"
    t.index ["entry_code_id"], name: "index_purchases_on_entry_code_id"
    t.index ["provider_id"], name: "index_purchases_on_provider_id"
    t.index ["receipt_type_id"], name: "index_purchases_on_receipt_type_id"
  end

  create_table "quotation_services", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "folio"
    t.decimal "subtotal", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.decimal "tax_item_total", precision: 18, scale: 6
    t.string "state"
    t.datetime "validity"
    t.bigint "currency_id", null: false
    t.decimal "exchange_rate", precision: 18, scale: 6
    t.bigint "customer_id", null: false
    t.text "condition"
    t.integer "created_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_tax"
    t.index ["currency_id"], name: "index_quotation_services_on_currency_id"
    t.index ["customer_id"], name: "index_quotation_services_on_customer_id"
  end

  create_table "quotations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "folio"
    t.decimal "subtotal", precision: 18, scale: 6
    t.decimal "total", precision: 18, scale: 6
    t.decimal "adjustment_total", precision: 18, scale: 6
    t.decimal "tax", precision: 18, scale: 6
    t.decimal "tax_total", precision: 18, scale: 6
    t.decimal "tax_item_total", precision: 18, scale: 6
    t.string "state"
    t.datetime "validity"
    t.bigint "currency_id"
    t.decimal "exchange_rate", precision: 18, scale: 6
    t.bigint "customer_id"
    t.text "condition"
    t.integer "created_by_id"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_tax"
    t.index ["currency_id"], name: "index_quotations_on_currency_id"
    t.index ["customer_id"], name: "index_quotations_on_customer_id"
  end

  create_table "receipt_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "related_uuids", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "sale_id"
    t.string "uuid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relation_bills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "relation_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "record_type"
    t.bigint "record_id"
    t.string "folio"
    t.bigint "payment_method_id", null: false
    t.bigint "payment_way_id", null: false
    t.integer "created_by_id"
    t.string "state"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "bill_key"
    t.string "bill_state"
    t.string "cancellation_state"
    t.integer "use_of_cfdi_id"
    t.string "payment_condition"
    t.string "uuid"
    t.string "bill_folio"
    t.boolean "is_due"
    t.integer "relation_bill_id"
    t.string "related"
    t.index ["payment_method_id"], name: "index_sales_on_payment_method_id"
    t.index ["payment_way_id"], name: "index_sales_on_payment_way_id"
    t.index ["record_type", "record_id"], name: "index_sales_on_record_type_and_record_id"
  end

  create_table "service_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date_admission"
    t.string "folio"
    t.bigint "customer_id", null: false
    t.bigint "product_id", null: false
    t.string "serie"
    t.string "brand"
    t.string "model"
    t.integer "created_by_id"
    t.text "observation"
    t.datetime "deleted_at"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["customer_id"], name: "index_service_orders_on_customer_id"
    t.index ["product_id"], name: "index_service_orders_on_product_id"
  end

  create_table "stock_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_variant_id", null: false
    t.decimal "stock", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "depot_id"
    t.index ["product_variant_id"], name: "index_stock_items_on_product_variant_id"
  end

  create_table "stock_movements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "stock_item_id", null: false
    t.string "folio"
    t.string "description"
    t.decimal "stock", precision: 10, scale: 2
    t.integer "quantity"
    t.decimal "total", precision: 18, scale: 6
    t.bigint "currency_id", null: false
    t.decimal "cost_price", precision: 18, scale: 6
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_stock_movements_on_currency_id"
    t.index ["stock_item_id"], name: "index_stock_movements_on_stock_item_id"
  end

  create_table "subcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "category_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "taxes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "amount", precision: 18, scale: 6
    t.decimal "value", precision: 18, scale: 6
    t.boolean "default"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_service_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "units", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "abbreviation"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unit_key"
    t.string "unit_description"
  end

  create_table "use_of_cfdis", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cfdi_key"
    t.string "name"
    t.boolean "persona_fisica"
    t.boolean "persona_moral"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "lastname"
    t.string "phone"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id"
    t.string "company"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "users_customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_users_customers_on_customer_id"
    t.index ["user_id"], name: "index_users_customers_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activity_descriptions", "diagnoses"
  add_foreign_key "categories", "category_types"
  add_foreign_key "customer_addresses", "customers"
  add_foreign_key "customer_banks", "customers"
  add_foreign_key "customer_contacts", "customers"
  add_foreign_key "diagnoses", "service_orders"
  add_foreign_key "diagnoses_types", "diagnoses"
  add_foreign_key "diagnoses_types", "diagnosis_types"
  add_foreign_key "diagnosis_descriptions", "diagnoses"
  add_foreign_key "expense_amounts", "expenses"
  add_foreign_key "expenses", "accounts"
  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "category_types"
  add_foreign_key "expenses", "document_types"
  add_foreign_key "expenses", "payment_methods"
  add_foreign_key "expenses", "providers"
  add_foreign_key "items", "product_variants"
  add_foreign_key "lending_items", "product_variants"
  add_foreign_key "lendings", "currencies"
  add_foreign_key "lendings", "entry_codes"
  add_foreign_key "lendings", "providers"
  add_foreign_key "lendings", "receipt_types"
  add_foreign_key "order_accessories", "service_orders"
  add_foreign_key "orders", "currencies"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders_types", "service_orders"
  add_foreign_key "orders_types", "type_service_orders"
  add_foreign_key "product_variant_images", "product_variants"
  add_foreign_key "product_variants", "currencies"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "product_lines"
  add_foreign_key "products", "providers"
  add_foreign_key "products", "units"
  add_foreign_key "products_accessories", "accessories"
  add_foreign_key "products_accessories", "products"
  add_foreign_key "products_deliverables", "deliverables"
  add_foreign_key "products_deliverables", "products"
  add_foreign_key "project_items", "product_variants"
  add_foreign_key "projects", "currencies"
  add_foreign_key "projects", "entry_codes"
  add_foreign_key "projects", "providers"
  add_foreign_key "projects", "receipt_types"
  add_foreign_key "provider_addresses", "providers"
  add_foreign_key "provider_banks", "providers"
  add_foreign_key "provider_contacts", "providers"
  add_foreign_key "purchase_items", "product_variants"
  add_foreign_key "purchases", "currencies"
  add_foreign_key "purchases", "entry_codes"
  add_foreign_key "purchases", "providers"
  add_foreign_key "purchases", "receipt_types"
  add_foreign_key "quotation_services", "currencies"
  add_foreign_key "quotation_services", "customers"
  add_foreign_key "quotations", "currencies"
  add_foreign_key "quotations", "customers"
  add_foreign_key "sales", "payment_methods"
  add_foreign_key "sales", "payment_ways"
  add_foreign_key "service_orders", "customers"
  add_foreign_key "service_orders", "products"
  add_foreign_key "stock_items", "product_variants"
  add_foreign_key "stock_movements", "currencies"
  add_foreign_key "stock_movements", "stock_items"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "users", "roles"
  add_foreign_key "users_customers", "customers"
  add_foreign_key "users_customers", "users"
end
