class Admin::ServiceOrdersController < ApplicationController
  load_and_authorize_resource
  before_action :set_service_order, only: [:show, :edit, :update, :destroy, :delete, :show_from_modal, :show_from_pdf, :diagnoses, :output, :delivered, :sales]
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

  def diagnoses
    @service_order.diagnosis.nil? ? @service_order.build_diagnosis : @service_order.diagnosis
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

    if params[:service_order][:images].present?
        params[:service_order][:images].each do |image|
        @service_order.images.attach(image)
      end
    end

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
    #@service_order.diagnosis ||= @service_order.build_diagnosis
    
    #@service_order.diagnosis.diagnosis_descriptions.created_by_id = current_user.id
    if params[:service_order][:diagnosis_attributes][:sale_attributes].present?
      @service_order.diagnosis.sale.nil? ? @service_order.diagnosis.build_sale : @service_order.diagnosis.sale
      @service_order.diagnosis.sale.created_by_id = current_user.id
    end

    if params[:service_order][:images].present?
        params[:service_order][:images].each do |image|
        @service_order.images.attach(image)
      end
    end

    if params[:service_order][:diagnosis_attributes].present?
      @service_order.diagnosis.nil? ? @service_order.build_diagnosis : @service_order.diagnosis
      if params[:service_order][:diagnosis_attributes][:images].present?
          params[:service_order][:diagnosis_attributes][:images].each do |image|
          @service_order.diagnosis.images.attach(image)
        end
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

  def delete
    respond_modal_for_delete_with(@service_order,true)
  end

  # DELETE /service_orders/1
  # DELETE /service_orders/1.json
  def destroy
    @service_order.save!(context: :delete)
    @object = @service_order
    respond_to do |format|
          if @object.save  
            search
            @objects= @collection
            format.js  { render "admin/shared/save.js.erb", layout: false, content_type: 'text/javascript' }
          else 
            format.js { render "admin/shared/error.js.erb", layout: false, content_type: 'text/javascript' }

           end
      end
  end

  def output
    respond_modal_for_output_with(@service_order,true)
  end

  # PUT /service_orders/1
  def delivered
    @service_order.save!(context: :output)
    @object = @service_order
    respond_to do |format|
          if @object.save  
            search
            @objects= @collection
            format.js  { render "admin/shared/save.js.erb", layout: false, content_type: 'text/javascript' }
          else 
            format.js { render "admin/shared/error.js.erb", layout: false, content_type: 'text/javascript' }

           end
      end
  end

  def sales
    @service_order.diagnosis.sale.nil? ? @service_order.diagnosis.build_sale : @service_order.diagnosis.sale
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
    total_accessories = @products.first.accessories.count
    #accessories_count = @products.first.accessories.count
    #@products.accessories ? accessories_count = @products.first.accessories.count : "null"
    respond_to do |format|
      format.json { render json: { total: total_count, products: @products.map { |s| {id: s.id, name:  s.name, accessories: s.accessories, total_accessories: total_accessories } } } }
    end
  end

  def product_variants
    @q = ProductVariant.ransack(params[:q])
    @product_variants = @q.result(distinct: true)
    total_count = @product_variants.count
    respond_to do |format|
      format.json { render json: { total: total_count,  product_variants: @product_variants.map { |s| {id: s.id, code:  s.code, unit_price: s.amount_public, unit: s.product.unit.name, image: s.first_image } } } }
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
        type_service_order_ids: [], images_attachments_attributes: [:id, :_destroy],
        diagnosis_attributes: [ :id, :service_order_id, :date, :delivery_time, :date_delivery, :diagnosis_type_id, :subtotal, :adjustment_total, :tax_total, :total,
          images_attachments_attributes: [:id, :_destroy],
          sale_attributes: [:id, :folio, :payment_method_id, :payment_way_id, :state, :_destroy],
          diagnosis_descriptions_attributes: [:id, :diagnosis_id, :description, :created_by_id, :deleted_at, :_destroy],
          items_attributes: [ :id, :product_variant_id, :name, :extended_description, :unit, :quantity, :unit_price, :total, :currency, :cost_price, :tax_item_total, :tax_total, :tax, :adjustment_total, :_destroy ]
          ]
        )
    end
end
