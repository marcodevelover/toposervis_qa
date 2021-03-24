class Admin::DashboardController < ApplicationController
  load_and_authorize_resource :class => :Dashboard
  
  def page_name
     @page_name = "Dashboard"
  end	
  def index
    @order = Order.where('deleted_at IS NULL').where('created_at >= "2021-03-24"').sum(:total)
    @service_order = ServiceOrder.joins('INNER JOIN diagnoses ON diagnoses.service_order_id = service_orders.id').where('service_orders.deleted_at is null').where(state: "sold").where('service_orders.created_at >= "2021-03-24"').sum(:total)
    @quotation = Quotation.where('deleted_at IS NULL').where(state: "sold").where('created_at >= "2021-03-24"').sum(:total)
    @sale_sum = @order + @service_order + @quotation

  	@quotation_count = Quotation.where('created_at >= "2021-03-24"').count
  	@order_service_count = ServiceOrder.where('created_at >= "2021-03-24"').count
  	@order_count = Order.where('created_at >= "2021-03-24"').count
  end
end
