class Admin::QuotationsController < ApplicationController
  before_action :set_quotation, only: [:show, :edit, :update, :destroy, :delete, :show_from_modal]
  respond_to :html, :json

  def page_name
     @page_name = "Cotizaciones"
  end
  # GET /quotations
  # GET /quotations.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
  end

  def show_from_modal
    respond_modal_with @quotation
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
    @quotation.condition = Condition.condition_default.first.description
    @factors_options = ["Importe", "Porcentaje"]
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = @quotation || Quotation.new(quotation_params)

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

  def delete
    respond_modal_for_delete_with(@quotation,true)
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation.save!(context: :delete)
  end

  def customers
    @q = Customer.ransack(params[:q])
    @customers = @q.result(distinct: true)
    total_count = @customers.count
    respond_to do |format|
      format.json { render json: { total: total_count,  customers: @customers.map { |s| {id: s.id, name:  s.name, rfc: s.rfc, business_name: s.business_name } } } }
    end
  end

  def filter_form
    @q = Quotation.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Quotation.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_params
      params.require(:quotation).permit(:number, :item_total, :total, :adjustment_total, :tax, :tax_total, :tax_item_total, :state, :validity, :currency_id, :exchange_rate, :customer_id, :condition, :created_by_id, :deleted_at,
        items_attributes: [ :id, :product_variant_id, :quotation_id, :quantity, :price, :total, :currency, :cost_price, :tax_item_total, :tax_total, :tax, :adjustment_total, :_destroy ]
        )
    end
end
