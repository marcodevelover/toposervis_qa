class Admin::QuotationsController < ApplicationController
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  def page_name
     @page_name = "Cotizaciones"
  end
  # GET /quotations
  # GET /quotations.json
  def index
    @quotations = Quotation.all
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
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
        format.html { redirect_to @quotation, notice: 'Quotation was successfully created.' }
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
        format.html { redirect_to @quotation, notice: 'Quotation was successfully updated.' }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render :edit }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation.destroy
    respond_to do |format|
      format.html { redirect_to quotations_url, notice: 'Quotation was successfully destroyed.' }
      format.json { head :no_content }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_params
      params.require(:quotation).permit(:number, :item_total, :total, :adjustment_total, :tax, :tax_total, :tax_item_total, :state, :validity, :currency_id, :exchange_rate, :customer_id, :condition, :created_by_id, :canceled_at,
        items_attributes: [ :id, :product_variant_id, :quotation_id, :quantity, :price, :total, :currency, :cost_price, :tax_item_total, :tax_total, :tax, :adjustment_total, :_destroy ]
        )
    end
end
