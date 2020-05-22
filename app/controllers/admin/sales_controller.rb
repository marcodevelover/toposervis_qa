class Admin::SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy, :delete, :show_from_modal, :show_from_pdf]
  respond_to :html, :json

  def page_name
     @page_name = "Ventas"
  end
  # GET /sales
  # GET /sales.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  def show_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "1f",
            
            template: "admin/sales/show_from_pdf.html.erb",
            layout: "pdf.html",
            viewport_size: '1280x1024'
            
            #lowquality: true,
            #zoom: 1,
            #dpi: 75
        end
    end
  end

  def show_from_modal
    respond_modal_with @sale
  end
  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = @sale || Sale.new(sale_params)
    @sale.created_by_id = current_user.id

    respond_to do |format|
      if @sale.save
        format.html { redirect_to [:admin, @sale], notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to [:admin, @sale], notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    respond_modal_for_delete_with(@sale,true)
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.save!(context: :delete)
    @object = @sale
    respond_to do |format|
          if @object.save  
            search
            @objects= @collection
            format.js  { render "admin/shared/save.js.erb", layout: false, content_type: 'text/javascript' }
          else 
            format.js { render "admin/shared/error.js.erb", layout: false, content_type: 'text/javascript' }
           end
      end
  end

  def customers
    @q = Customer.ransack(params[:q])
    @customers = @q.result(distinct: true)
    total_count = @customers.count
    respond_to do |format|
      format.json { render json: { total: total_count,  customers: @customers.map { |s| {id: s.id, name:  s.name, rfc: s.rfc, business_name: s.business_name } } } }
    end
  end

  def product_variants
    @q = ProductVariant.ransack(params[:q])
    @product_variants = @q.result(distinct: true)
    total_count = @product_variants.count
    respond_to do |format|
      format.json { render json: { total: total_count,  product_variants: @product_variants.map { |s| {id: s.id, code:  s.code, unit_price: s.amount_public, unit: s.product.unit.name, image: s.first_image } } } }
    end
  end

  def currencies
    @q = Currency.ransack(params[:q])
    @currencies = @q.result(distinct: true)
    total_count = @currencies.count
    respond_to do |format|
      format.json { render json: { total: total_count,  currencies: @currencies.map { |s| {id: s.id, abbreviation:  s.abbreviation, exchange_rate: s.exchange_rate } } } }
    end
  end

  def filter_form
    @q = Sale.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Sale.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:folio, :reference, :date, :observation, :payment_method_id, :payment_way_id, :subtotal, :item_total, :total, :adjustment_total, :tax, :tax_total, :tax_item_total, :state, :validity, :currency_id, :exchange_rate, :customer_id, :condition, :created_by_id, :deleted_at,
        items_attributes: [ :id, :product_variant_id, :name, :extended_description, :unit, :quantity, :unit_price, :total, :currency, :cost_price, :tax_item_total, :tax_total, :tax, :adjustment_total, :_destroy ]
        )
    end
end
