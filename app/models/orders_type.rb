class OrdersType < ApplicationRecord
  belongs_to :service_order
  belongs_to :type_service_order
end
