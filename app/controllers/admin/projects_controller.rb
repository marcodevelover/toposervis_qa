class Admin::ProjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_project, only: [:show, :edit, :update, :destroy, :delete, :show_from_modal, :show_from_pdf]
  respond_to :html, :json
  def page_name
     @page_name = t('project_module')
  end
  # GET /projects
  # GET /projects.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/projects/reports.xlsx.axlsx"}
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  def show_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "entrada_" + @project.folio,
            
            template: "admin/projects/show_from_pdf.html.erb",
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                         },
            footer:  {   html: {   template: "admin/projects/footer_pdf.html.erb"}}
        end
    end
  end

  def show_from_modal
    respond_modal_with @project
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.created_by_id = current_user.id
    respond_to do |format|
      if @project.save
        format.html { redirect_to [:admin, @project], notice: 'project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to [:admin, @project], notice: 'project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  def delete
    respond_modal_for_delete_with(@project,true)
  end
  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.save!(context: :delete)
    @object = @project
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
    @q = ProductVariant.where("product_variants.deleted_at IS NULL").where("product_variants.is_supplies = 1").ransack(params[:q])
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
    @q = Project.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    ####params[:per_page] = 10
    
    @q = Project.search(params[:q])
    @collection = @q.result(:distinct => true).order('id DESC').page(params[:page]).per(params[:per_page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:folio, :name, :description, :date, :observation, :subtotal, :total, :adjustment_total, :tax, :tax_total, :tax_item_total, :state, :validity, :currency_id, :exchange_rate, :receipt_type_id, :entry_code_id, :provider_id, :created_by_id, :deleted_at, :code_invoice, :payment_way_id,
        project_items_attributes: [ :id, :product_variant_id, :name, :observation, :unit, :quantity, :unit_price, :total, :currency, :cost_price, :tax_item_total, :tax_total, :tax, :adjustment_total, :number_serie, :number_procedure, :product_state, :observation, :_destroy, :serial_number ]
        )
    end
end
