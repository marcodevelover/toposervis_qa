class Admin::ServiceOrdersController < ApplicationController
  before_action :set_service_order, only: [:show, :edit, :update, :destroy, :delete, :show_from_modal, :show_from_pdf]
  respond_to :html, :json

  def page_name
     @page_name = "Orden de servicios"
  end
  # GET /service_orders
  # GET /service_orders.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /service_orders/1
  # GET /service_orders/1.json
  def show
  end

  def show_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "1f",
            
            template: "admin/service_orders/show_from_pdf.html.erb",
            layout: "pdf.html",
            viewport_size: '1280x1024'
            
            #lowquality: true,
            #zoom: 1,
            #dpi: 75
        end
    end
  end

  def show_from_modal
    respond_modal_with @service_order
  end

  # GET /service_orders/new
  def new
    @service_order = ServiceOrder.new
    #@service_order.order_accessories.build
  end

  # GET /service_orders/1/edit
  def edit
  end

  # POST /service_orders
  # POST /service_orders.json
  def create
    @service_order = ServiceOrder.new(service_order_params)
    @service_order.created_by_id = current_user.id
    respond_to do |format|
      if @service_order.save
        format.html { redirect_to [:admin, @service_order], notice: 'Service order was successfully created.' }
        format.json { render :show, status: :created, location: @service_order }
      else
        format.html { render :new }
        format.json { render json: @service_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_orders/1
  # PATCH/PUT /service_orders/1.json
  def update
    if params[:service_order][:images].present?
      params[:service_order][:images].each do |image|
      @service_order.images.attach(image)
    end
    end    
    respond_to do |format|
      if @service_order.update(service_order_params)
        format.html { redirect_to [:admin, @service_order], notice: 'Service order was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_order }
      else
        format.html { render :edit }
        format.json { render json: @service_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_orders/1
  # DELETE /service_orders/1.json
  def destroy
    @service_order.destroy
    respond_to do |format|
      format.html { redirect_to service_orders_url, notice: 'Service order was successfully destroyed.' }
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

  def products
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    total_count = @products.count
    #accessories_count = @products.first.accessories.count
    #@products.accessories ? accessories_count = @products.first.accessories.count : "null"
    respond_to do |format|
      format.json { render json: { total: total_count, products: @products.map { |s| {id: s.id, name:  s.name, accessories: s.accessories } } } }
    end
  end  

  def filter_form
    @q = ServiceOrder.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = ServiceOrder.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_order
      @service_order = ServiceOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_order_params
      params.require(:service_order).permit(:date_admission, :customer_id, :product_id, :serie, :brand, :model, :observation, :deleted_at, :status,
        order_accessories_attributes: [ :id, :service_order_id, :accessory, :quantity, :_destroy ],
        type_service_order_ids: [], images_attachments_attributes: [:id, :_destroy]
        )
    end
end
