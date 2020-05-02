class Admin::ProductVariantsController < ApplicationController
  before_action :set_product_variant, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('product_variant_module')
  end
  # GET /product_variants
  # GET /product_variants.json

  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /product_variants/1
  # GET /product_variants/1.json
  def show
    respond_modal_with @product_variant
  end

  # GET /product_variants/new
  def new
    @product_variant = ProductVariant.new
    respond_modal_with @product_variant
  end

  # GET /product_variants/1/edit
  def edit
    respond_modal_with @product_variant
  end

  # POST /product_variants
  # POST /product_variants.json
  def create
    @product_variant = ProductVariant.new(product_variant_params)

    respond_modal_action_with(@product_variant)
  end

  # PATCH/PUT /product_variants/1
  # PATCH/PUT /product_variants/1.json
  def update
    @product_variant.attributes =  product_variant_params 
    respond_modal_action_with_hide(@product_variant)
  end

  def delete
    respond_modal_for_delete_with(@product_variant,true)
  end

  # DELETE /product_variants/1
  # DELETE /product_variants/1.json
  def destroy
    @product_variant.save!(context: :delete)
  end

  def filter_form
    @q = ProductVariant.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = ProductVariant.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variant
      @product_variant = ProductVariant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_variant_params
      params.require(:product_variant).permit(
        :code, :code_alternative, :stocking_time, :cost_price, :currency_id, :amount_public, :amount_provider, :amount_shipping, :stock_min, :stock_max, :product_id, :deleted_at,
        product_variant_images_attributes: [:id, :product_variant_id, :_destroy, :image]
        )
    end
end
