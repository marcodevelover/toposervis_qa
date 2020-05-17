class Admin::TypeServiceOrdersController < ApplicationController
  before_action :set_type_service_order, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('type_service_order_module')
  end
  # GET /admin/type_service_orders
  # GET /admin/type_service_orders.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/type_service_orders/1
  # GET /admin/type_service_orders/1.json
  def show
    respond_modal_with @type_service_order
  end

  # GET /admin/type_service_orders/new
  def new
    @type_service_order = TypeServiceOrder.new
    respond_modal_with @type_service_order
  end

  # GET /admin/type_service_orders/1/edit
  def edit
    respond_modal_with @type_service_order
  end

  # POST /admin/type_service_orders
  # POST /admin/type_service_orders.json
  def create
    @type_service_order = TypeServiceOrder.new(type_service_order_params)

    respond_modal_action_with(@type_service_order)
  end

  # PATCH/PUT /admin/type_service_orders/1
  # PATCH/PUT /admin/type_service_orders/1.json
  def update
    @type_service_order.attributes =  type_service_order_params 
    respond_modal_action_with(@type_service_order)
  end

  def delete
    respond_modal_for_delete_with(@type_service_order,true)
  end

  # DELETE /admin/type_service_orders/1
  # DELETE /admin/type_service_orders/1.json
  def destroy
    @type_service_order.save!(context: :delete)
  end

  def filter_form
    @q = TypeServiceOrder.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = TypeServiceOrder.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_service_order
      @type_service_order = TypeServiceOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_service_order_params
      params.require(:type_service_order).permit(:name, :description, :deleted_at)
    end
end
