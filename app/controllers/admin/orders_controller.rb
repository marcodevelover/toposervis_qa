class Admin::OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :set_order, only: [:show, :edit, :update, :destroy, :delete, :show_from_modal, :show_from_pdf, :note_from_pdf, :bill, :invoice, :cancel_invoice, :request_cancellation_state_invoice, :cancellation_state_invoice]
  respond_to :html, :json

  def page_name
     @page_name = "Venta por nota de venta"
  end
  # GET /orders
  # GET /orders.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/orders/reports.xlsx.axlsx"}
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show    
  end

  def show_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "orden_venta_" + @order.sale.folio,
            
            template: "admin/orders/show_from_pdf.html.erb",
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                         },
            footer:  {   html: {   template: "admin/orders/footer_pdf.html.erb"}}
        end
    end
  end

  def note_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "nota_de_venta_" + @order.sale.folio,
            template: "admin/orders/note_from_pdf.html.erb",
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                      }
            #footer:  {   html: {   template: "admin/quotations/footer_pdf.html.erb"}}
        end
    end
  end

  def show_from_modal
    respond_modal_with @order
  end
  # GET /orders/new
  def new
    @order = Order.new
    @sale = @order.build_sale
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = @order || Order.new(order_params)
    @order.created_by_id = current_user.id

    respond_to do |format|
      if @order.save
        format.html { redirect_to [:admin, @order], notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to [:admin, @order], notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    respond_modal_for_delete_with(@order,true)
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.save!(context: :delete)
    @object = @order
    respond_to do |format|
      search
      @objects= @collection
      format.js  { render "admin/shared/save.js.erb", layout: false, content_type: 'text/javascript' }
    end
  end

  def customers
    @q = Customer.active.ransack(params[:q])
    @customers = @q.result(distinct: true)
    total_count = @customers.count
    respond_to do |format|
      format.json { render json: { total: total_count,  customers: @customers.map { |s| {id: s.id, name:  s.name, rfc: s.rfc, business_name: s.business_name } } } }
    end
  end

  def product_variants
    @q = ProductVariant.select('product_variants.*, product_stocks.serial_number').left_outer_joins(:product_stocks).where("product_stocks.status IS NULL").where("products.deleted_at IS NULL").where("products.available_for_sale != 0").ransack(params[:q])
    @product_variants = @q.result(distinct: true)
    #total_count = @product_variants.count
    respond_to do |format|
      format.json { render json: {   product_variants: @product_variants.map { |s| {id: s.id, code:  s.code, required_serial_number: s.product.required_serial_number, product_name: s.product.name, product_model: s.product.model, product_brand: s.product.brand, unit_price: s.amount_public, exchange_name: s.currency.name, exchange_rate: s.currency.exchange_rate, unit: s.product.unit.name, stock: s.stock_item.stock, image: s.first_image, serial_number: s.serial_number} } } }
    end
  end

  def product_stocks
    @q = ProductStock.ransack(params[:q])
    @product_stocks = @q.result(distinct: true)
    total_count = @product_stocks.count
    respond_to do |format|
      format.json { render json: { total: total_count,  product_stocks: @product_stocks.map { |s| {id: s.id, product_variant_id: s.product_variant.id, required_serial_number: s.product_variant.product.required_serial_number, serial_number:  s.serial_number, code: s.product_variant.code, product_name: s.product_variant.product.name, product_model: s.product_variant.product.model, product_brand: s.product_variant.product.brand, unit_price: s.product_variant.amount_public, exchange_name: s.product_variant.currency.name, exchange_rate: s.product_variant.currency.exchange_rate, unit: s.product_variant.product.unit.name } } } }
    end
  end

  def currencies
    @q = Currency.ransack(params[:q])
    @currencies = @q.result(distinct: true)
    total_count = @currencies.count
    respond_to do |format|
      format.json { render json: { total: total_count,  currencies: @currencies.map { |s| {id: s.id, name:  s.name, description:  s.description, abbreviation:  s.abbreviation, exchange_rate: s.exchange_rate } } } }
    end
  end

  def filter_form
    @q = Order.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    #####params[:per_page] = 10
    
    @q = Order.search(params[:q])
    @collection = @q.result(:distinct => true).includes(:sale).order('id DESC').page(params[:page]).per(params[:per_page])
  end

  def bill
    respond_modal_for_bill_with(@order,true)
  end

  # PUT /orders/1
  def invoice
    @order.save!(context: :bill)
  end

  def request_cancel_invoice
    respond_modal_for_request_cancel_invoice_with(@order,true)
  end  

  def cancel_invoice
    @order.save!(context: :request_cancel_invoice)
  end

  def request_cancellation_state_invoice
    respond_modal_for_request_cancellation_state_invoice_with(@order,true)
  end  

  def cancellation_state_invoice
    @order.save!(context: :request_cancellation_state_invoice)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:folio, :reference, :date, :observation, :payment_method_id, :payment_way_id, :subtotal, :item_total, :total, :adjustment_total, :tax, :tax_total, :tax_item_total, :state, :validity, :currency_id, :exchange_rate, :customer_id, :condition, :created_by_id, :is_tax, :deleted_at,
        sale_attributes: [:id, :folio, :payment_method_id, :payment_way_id, :use_of_cfdi_id, :state, :_destroy, :payment_condition, :uuid, :bill_folio],
        items_attributes: [ :id, :product_variant_id, :name, :extended_description, :unit, :quantity, :unit_price, :total, :currency, :cost_price, :tax_item_total, :tax_total, :tax, :adjustment_total, :serial_number, :_destroy ]
        )
    end
end
