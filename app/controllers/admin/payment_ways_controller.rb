class Admin::PaymentWaysController < ApplicationController
  load_and_authorize_resource
  before_action :set_payment_way, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('payment_way_module')
  end
  # GET /admin/payment_ways
  # GET /admin/payment_ways.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/payment_ways/1
  # GET /admin/payment_ways/1.json
  def show
    respond_modal_with @payment_way
  end

  # GET /admin/payment_ways/new
  def new
    @payment_way = PaymentWay.new
    respond_modal_with @payment_way
  end

  # GET /admin/payment_ways/1/edit
  def edit
    respond_modal_with @payment_way
  end

  # POST /admin/payment_ways
  # POST /admin/payment_ways.json
  def create
    @payment_way = PaymentWay.new(payment_way_params)

    respond_modal_action_with(@payment_way)
  end

  # PATCH/PUT /admin/payment_ways/1
  # PATCH/PUT /admin/payment_ways/1.json
  def update
    @payment_way.attributes =  payment_way_params 
    respond_modal_action_with(@payment_way)
  end

  def delete
    respond_modal_for_delete_with(@payment_way,true)
  end

  # DELETE /admin/payment_ways/1
  # DELETE /admin/payment_ways/1.json
  def destroy
    @payment_way.save!(context: :delete)
  end

  def filter_form
    @q = PaymentWay.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = PaymentWay.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_way
      @payment_way = PaymentWay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_way_params
      params.require(:payment_way).permit(:name, :description, :deleted_at)
    end
end
