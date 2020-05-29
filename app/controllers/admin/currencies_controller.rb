class Admin::CurrenciesController < ApplicationController
  load_and_authorize_resource
  before_action :set_currency, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('currency_module')
  end
  # GET /admin/currencies
  # GET /admin/currencies.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/currencies/1
  # GET /admin/currencies/1.json
  def show
    respond_modal_with @currency
  end

  # GET /admin/currencies/new
  def new
    @currency = Currency.new
    respond_modal_with @currency
  end

  # GET /admin/currencies/1/edit
  def edit
    respond_modal_with @currency
  end

  # POST /admin/currencies
  # POST /admin/currencies.json
  def create
    @currency = Currency.new(currency_params)

    respond_modal_action_with(@currency)
  end

  # PATCH/PUT /admin/currencies/1
  # PATCH/PUT /admin/currencies/1.json
  def update
    @currency.attributes =  currency_params 
    respond_modal_action_with(@currency)
  end

  def delete
    respond_modal_for_delete_with(@currency,true)
  end

  # DELETE /admin/currencies/1
  # DELETE /admin/currencies/1.json
  def destroy
    @currency.save!(context: :delete)
  end

  def filter_form
    @q = Currency.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Currency.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currency_params
      params.require(:currency).permit(:name, :description, :abbreviation, :exchange_rate, :deleted_at)
    end
end