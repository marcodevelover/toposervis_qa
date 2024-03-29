class Admin::PurchasesController < ApplicationController
  load_and_authorize_resource
  before_action :set_purchase, only: [:show, :edit, :update, :destroy, :delete, :show_from_modal, :show_from_pdf]
  respond_to :html, :json
  def page_name
     @page_name = "Entradas"
  end
  # GET /purchases
  # GET /purchases.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/purchases/reports.xlsx.axlsx"}
    end
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  def show_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "entrada_" + @purchase.folio,
            
            template: "admin/purchases/show_from_pdf.html.erb",
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                         },
            footer:  {   html: {   template: "admin/purchases/footer_pdf.html.erb"}}
        end
    end
  end

  def show_from_modal
    respond_modal_with @purchase
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.created_by_id = current_user.id
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to [:admin, @purchase], notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to [:admin, @purchase], notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end
  def delete
    respond_modal_for_delete_with(@purchase,true)
  end
  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.save!(context: :delete)
    @object = @purchase
    respond_to do |format|
      search
      @objects= @collection
      format.js  { render "admin/shared/save.js.erb", layout: false, content_type: 'text/javascript' }
    end
  end

  def providers
    @q = Provider.ransack(params[:q])
    @providers = @q.result(distinct: true)
    total_count = @providers.count
    respond_to do |format|
      format.json { render json: { total: total_count,  providers: @providers.map { |s| {id: s.id, name:  s.name, rfc: s.rfc, business_name: s.business_name } } } }
    end
  end

  def product_variants
    @q = ProductVariant.where("product_variants.deleted_at IS NULL").ransack(params[:q])
    @product_variants = @q.result(distinct: true)
    total_count = @product_variants.count
    respond_to do |format|
      format.json { render json: { total: total_count,  product_variants: @product_variants.map { |s| {id: s.id, code:  s.code, product_name: s.product.name, required_serial_number: s.product.required_serial_number, product_model: s.product.model, product_brand: s.product.brand, unit_price: s.amount_public, amount_provider: s.cost_price, exchange_name: s.currency.name, exchange_rate: s.currency.exchange_rate, unit: s.product.unit.name, stock: s.stock_item.stock, provider: s.product.provider.name } } } }
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
    @q = Purchase.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    ####params[:per_page] = 10
    
    @q = Purchase.search(params[:q])
    @collection = @q.result(:distinct => true).order('id DESC').page(params[:page]).per(params[:per_page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:folio, :date, :observation, :subtotal, :total, :adjustment_total, :tax, :tax_total, :tax_item_total, :state, :validity, :currency_id, :exchange_rate, :receipt_type_id, :entry_code_id, :provider_id, :created_by_id, :deleted_at, :code_invoice, :payment_way_id,
        purchase_items_attributes: [ :id, :product_variant_id, :name, :observation, :unit, :quantity, :unit_price, :total, :currency, :cost_price, :tax_item_total, :tax_total, :tax, :adjustment_total, :number_serie, :number_procedure, :product_state, :observation, :_destroy, :serial_number ]
        )
    end
end
