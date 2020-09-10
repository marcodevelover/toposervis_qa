class Admin::PaymentMethodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_payment_method, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('payment_method_module')
  end
  # GET /admin/payment_methods
  # GET /admin/payment_methods.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/payment_methods/reports.xlsx.axlsx"}
    end
  end

  # GET /admin/payment_methods/1
  # GET /admin/payment_methods/1.json
  def show
    respond_modal_with @payment_method
  end

  # GET /admin/payment_methods/new
  def new
    @payment_method = PaymentMethod.new
    respond_modal_with @payment_method
  end

  # GET /admin/payment_methods/1/edit
  def edit
    respond_modal_with @payment_method
  end

  # POST /admin/payment_methods
  # POST /admin/payment_methods.json
  def create
    @payment_method = PaymentMethod.new(payment_method_params)

    respond_modal_action_with(@payment_method)
  end

  # PATCH/PUT /admin/payment_methods/1
  # PATCH/PUT /admin/payment_methods/1.json
  def update
    @payment_method.attributes =  payment_method_params 
    respond_modal_action_with(@payment_method)
  end

  def delete
    respond_modal_for_delete_with(@payment_method,true)
  end

  # DELETE /admin/payment_methods/1
  # DELETE /admin/payment_methods/1.json
  def destroy
    @payment_method.save!(context: :delete)
  end

  def filter_form
    @q = PaymentMethod.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = PaymentMethod.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_method
      @payment_method = PaymentMethod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_method_params
      params.require(:payment_method).permit(:name, :description, :deleted_at)
    end
end
