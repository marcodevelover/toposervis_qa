class Admin::DashboardController < ApplicationController
  load_and_authorize_resource :class => :Dashboard
  
  def page_name
     @page_name = "Dashboard"
  end	
  def index
  	@item_sum = Item.sum(:total)
  	@quotation_count = Quotation.count
  	@order_service_count = ServiceOrder.count
  	@order_count = Order.count
  end
end
