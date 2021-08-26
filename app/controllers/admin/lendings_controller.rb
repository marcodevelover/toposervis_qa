class Admin::LendingsController < ApplicationController
  load_and_authorize_resource
  before_action :set_lending, only: [:show, :edit, :update, :destroy, :delete, :show_from_modal, :show_from_pdf]
  respond_to :html, :json
  def page_name
     @page_name = t('lending_module')
  end
  # GET /lendings
  # GET /lendings.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/lendings/reports.xlsx.axlsx"}
    end
  end

  # GET /lendings/1
  # GET /lendings/1.json
  def show
  end

  def show_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "entrada_" + @lending.folio,
            
            template: "admin/lendings/show_from_pdf.html.erb",
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                         },
            footer:  {   html: {   template: "admin/lendings/footer_pdf.html.erb"}}
        end
    end
  end

  def show_from_modal
    respond_modal_with @lending
  end

  # GET /lendings/new
  def new
    @lending = Lending.new
  end

  # GET /lendings/1/edit
  def edit
  end

  # POST /lendings
  # POST /lendings.json
  def create
    @lending = Lending.new(lending_params)
    @lending.created_by_id = current_user.id
    respond_to do |format|
      if @lending.save
        format.html { redirect_to [:admin, @lending], notice: 'lending was successfully created.' }
        format.json { render :show, status: :created, location: @lending }
      else
        format.html { render :new }
        format.json { render json: @lending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lendings/1
  # PATCH/PUT /lendings/1.json
  def update
    respond_to do |format|
      if @lending.update(lending_params)
        format.html { redirect_to [:admin, @lending], notice: 'lending was successfully updated.' }
        format.json { render :show, status: :ok, location: @lending }
      else
        format.html { render :edit }
        format.json { render json: @lending.errors, status: :unprocessable_entity }
      end
    end
  end
  def delete
    respond_modal_for_delete_with(@lending,true)
  end
  # DELETE /lendings/1
  # DELETE /lendings/1.json
  def destroy
    @lending.save!(context: :delete)
    @object = @lending
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
    @q = Lending.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    ####params[:per_page] = 10
    
    @q = Lending.search(params[:q])
    @collection = @q.result(:distinct => true).order('id DESC').page(params[:page]).per(params[:per_page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lending
      @lending = Lending.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lending_params
      params.require(:lending).permit(:folio, :name, :description, :responsible, :date, :observation, :subtotal, :total, :adjustment_total, :tax, :tax_total, :tax_item_total, :state, :validity, :currency_id, :exchange_rate, :receipt_type_id, :entry_code_id, :provider_id, :created_by_id, :deleted_at, :code_invoice, :payment_way_id,
        lending_items_attributes: [ :id, :product_variant_id, :name, :observation, :unit, :quantity, :unit_price, :total, :currency, :cost_price, :tax_item_total, :tax_total, :tax, :adjustment_total, :number_serie, :number_procedure, :product_state, :observation, :_destroy, :serial_number, :state ]
        )
    end
end
