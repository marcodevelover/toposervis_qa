class Admin::QuotationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_quotation, only: [:show, :edit, :update, :destroy, :delete, :show_from_modal, :show_from_pdf, :note_from_pdf, :sales, :bill, :invoice, :cancel_invoice, :request_cancellation_state_invoice, :cancellation_state_invoice]
  respond_to :html, :json

  def page_name
     @page_name = "Cotizaciones de productos"
  end
  # GET /quotations
  # GET /quotations.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            params[:per_page] = 10000
            format.xlsx {render xlsx: "reports", template: "admin/quotations/reports.xlsx.axlsx"}
    end
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
  end

  def show_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "cotizacion_" + @quotation.folio,
            
            template: "admin/quotations/show_from_pdf.html.erb",
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                         },
            footer:  {   html: {   template: "admin/quotations/footer_pdf.html.erb"}}
        end
    end
  end

  def note_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "nota_de_venta_" + @quotation.folio,
            template: "admin/quotations/note_from_pdf.html.erb",
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
    respond_modal_with @quotation
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
    conditions = []
    Condition.condition_default.active.product.or(Condition.both).each do |condition|
      conditions << condition.description
      @conditions = conditions.join("<br>")
    end
    @quotation.condition = @conditions

    @factors_options = ["Importe", "Porcentaje"]
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = @quotation || Quotation.new(quotation_params)
    @quotation.created_by_id = current_user.id

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to [:admin, @quotation], notice: 'Quotation was successfully created.' }
        format.json { render :show, status: :created, location: @quotation }
      else
        format.html { render :new }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1
  # PATCH/PUT /quotations/1.json
  def update
    if params[:quotation][:sale_attributes].present?
      @quotation.sale.nil? ? @quotation.build_sale : @quotation.sale
      @quotation.sale.created_by_id = current_user.id
    end

    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to [:admin, @quotation], notice: 'Quotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render [:admin, @quotation] }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  def to_sell
    if params[:quotation][:sale_attributes].present?
      @quotation.sale.nil? ? @quotation.build_sale : @quotation.sale
      @quotation.sale.created_by_id = current_user.id
    end

    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to [:admin, @quotation], notice: 'Quotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render :sales }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    respond_modal_for_delete_with(@quotation,true)
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation.save!(context: :delete)
    @object = @quotation
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

  def sales
    @quotation.sale.nil? ? @quotation.build_sale : @quotation.sale
  end

  def product_variants
    @q = ProductVariant.where('product_variants.deleted_at IS NULL').where("products.available_for_sale != 0").where("products.is_service = 0").ransack(params[:q])
    @product_variants = @q.result(distinct: true)
    total_count = @product_variants.count
    respond_to do |format|
      format.json { render json: { total: total_count,  product_variants: @product_variants.map { |s| {id: s.id, code:  s.code, product_name: s.product.name, product_model: s.product.model, product_brand: s.product.brand, unit_price: s.amount_public, exchange_name: s.currency.name, exchange_rate: s.currency.exchange_rate, unit: s.product.unit.name, stock: s.stock_item.stock, image: s.first_image } } } }
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
    @q = Quotation.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    #######params[:per_page] = 10
    
    @q = Quotation.search(params[:q])
    @collection = @q.result(:distinct => true).order('id DESC').page(params[:page]).per(params[:per_page])
  end

  def bill
    respond_modal_for_bill_with(@quotation,true)
  end

  # PUT /orders/1
  def invoice
    @quotation.save!(context: :bill)
  end

  def request_cancel_invoice
    respond_modal_for_request_cancel_invoice_with(@quotation,true)
  end  

  def cancel_invoice
    @quotation.save!(context: :request_cancel_invoice)
  end

  def request_cancellation_state_invoice
    respond_modal_for_request_cancellation_state_invoice_with(@quotation,true)
  end  

  def cancellation_state_invoice
    @quotation.save!(context: :request_cancellation_state_invoice)
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_params
      params.require(:quotation).permit(:folio, :subtotal, :item_total, :total, :adjustment_total, :tax, :tax_total, :tax_item_total, :state, :validity, :currency_id, :exchange_rate, :customer_id, :condition, :created_by_id, :is_tax, :deleted_at,
        sale_attributes: [:id, :folio, :payment_method_id, :payment_way_id, :use_of_cfdi_id, :state, :_destroy],
        items_attributes: [ :id, :product_variant_id, :name, :extended_description, :unit, :quantity, :unit_price, :total, :currency, :cost_price, :tax_item_total, :tax_total, :tax, :adjustment_total, :_destroy, :serial_number ]
        )
    end
end
