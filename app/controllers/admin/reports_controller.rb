class Admin::ReportsController < ApplicationController
  load_and_authorize_resource :class => :Report
  def page_name
     @page_name = "Reportes"
  end

  def quotations_total
    @page_description = 'Cotizaciones'
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
    @page_description = 'Ordenes de servicio'
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
    @page_description = 'Ordenes'
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
    @page_description = 'Ventas'
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

  def products_total
    @page_description = 'Existencias'
    @q = Product.ransack(params[:q])
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
            format.xlsx {render xlsx: "reports", template: "admin/products/reports.xlsx.axlsx"}
    end
  end    
  
  def kardex
    @page_description = 'KARDEX'
    @q = Product.ransack(params[:q])
    unless params[:q].nil?
      created_at_gt = params[:q][:created_at_gteq]
      created_at_lt = params[:q][:created_at_lteq]

      if params[:q][:created_at_gteq].present?
        params[:q][:created_at_gteq] = Time.zone.parse(params[:q][:created_at_gteq]) rescue ""
      end

      if params[:q][:created_at_lteq].present?
        params[:q][:created_at_lteq] = Time.zone.parse(params[:q][:created_at_lteq]) rescue ""
      end
      
      @collection = @q.result(distinct: true).
      select('products.*, stock_movements.folio, stock_movements.description, stock_movements.stock, stock_movements.quantity, stock_movements.cost_price, stock_movements.deleted_at, stock_movements.created_at').
      joins(product_variants: [{ stock_item: :stock_movements }]).
      page(params[:page]).per(params[:per_page])
    end
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/products/kardex.xlsx.axlsx"}
    end 
  end
end
