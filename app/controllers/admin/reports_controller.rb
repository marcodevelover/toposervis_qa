class Admin::ReportsController < ApplicationController

  def page_name
     @page_name = "Reportes"
  end

  def quotations_total
  	@q = Quotation.ransack(params[:q])
    unless params[:q].nil?
      created_at_gt = params[:q][:created_at_gteq]
      created_at_lt = params[:q][:created_at_lteq]

      if params[:q][:created_at_gteq].present?
        params[:q][:created_at_gteq] = Time.zone.parse(params[:q][:created_at_gteq]) rescue ""
      end

      if params[:q][:created_at_lteq].present?
        params[:q][:created_at_lteq] = Time.zone.parse(params[:q][:created_at_lteq]) rescue ""
      end

      @collection = @q.result(:distinct => true).includes(:customer).page(params[:page]).per(params[:per_page])
    end
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/quotations/reports.xlsx.axlsx"}
    end
  end

  def service_orders_total
    @q = ServiceOrder.ransack(params[:q])
    unless params[:q].nil?
      created_at_gt = params[:q][:created_at_gteq]
      created_at_lt = params[:q][:created_at_lteq]

      if params[:q][:created_at_gteq].present?
        params[:q][:created_at_gteq] = Time.zone.parse(params[:q][:created_at_gteq]) rescue ""
      end

      if params[:q][:created_at_lteq].present?
        params[:q][:created_at_lteq] = Time.zone.parse(params[:q][:created_at_lteq]) rescue ""
      end

      @collection = @q.result(:distinct => true).includes(:customer).page(params[:page]).per(params[:per_page])
    end
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/service_orders/reports.xlsx.axlsx"}
    end
  end  

  def orders_total
    @q = Order.ransack(params[:q])
    unless params[:q].nil?
      created_at_gt = params[:q][:created_at_gteq]
      created_at_lt = params[:q][:created_at_lteq]

      if params[:q][:created_at_gteq].present?
        params[:q][:created_at_gteq] = Time.zone.parse(params[:q][:created_at_gteq]) rescue ""
      end

      if params[:q][:created_at_lteq].present?
        params[:q][:created_at_lteq] = Time.zone.parse(params[:q][:created_at_lteq]) rescue ""
      end

      @collection = @q.result(:distinct => true).includes(:customer, :sale).page(params[:page]).per(params[:per_page])
    end
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/orders/reports.xlsx.axlsx"}
    end
  end  

  def sales_total
    @q = Sale.ransack(params[:q])
    unless params[:q].nil?
      created_at_gt = params[:q][:created_at_gteq]
      created_at_lt = params[:q][:created_at_lteq]

      if params[:q][:created_at_gteq].present?
        params[:q][:created_at_gteq] = Time.zone.parse(params[:q][:created_at_gteq]) rescue ""
      end

      if params[:q][:created_at_lteq].present?
        params[:q][:created_at_lteq] = Time.zone.parse(params[:q][:created_at_lteq]) rescue ""
      end

      @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])
    end
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/sales/reports.xlsx.axlsx"}
    end
  end  
  
end
