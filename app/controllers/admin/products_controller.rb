class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :delete, :add_accessory]
  respond_to :html, :json
  
  def page_name
     @page_name = t('product_module')
  end
  # GET /admin/products
  # GET /admin/products.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
    respond_modal_with @product
  end

  # GET /admin/products/new
  def new
    @product = Product.new
    @product.product_variants.build
    respond_modal_with @product
  end

  # GET /admin/products/1/edit
  def edit
    respond_modal_with @product
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @product = Product.new(product_params)
    respond_modal_action_with(@product)
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    @product.attributes =  product_params 
    respond_modal_action_with(@product)
  end

  def delete
    respond_modal_for_delete_with(@product,true)
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @product.save!(context: :delete)
  end

  def add_accessory
    @product.products_accessories.build
    respond_modal_with @product
  end

  def filter_form
    @q = Product.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Product.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(
        :name, :brand, :model, :description, :comment, :product_line_id, :unit_id, :provider_id, :deleted_at, 
        products_accessories_attributes: [:id, :product_id, :accessory_id, :_destroy],
        product_variants_attributes: [ :id, :code, :code_alternative, :stocking_time, :cost_price, :currency_id, :amount_public, :amount_provider, :amount_shipping, :stock_min, :stock_max, :product_id, :deleted_at, :_destroy ],
        )
    end
end
