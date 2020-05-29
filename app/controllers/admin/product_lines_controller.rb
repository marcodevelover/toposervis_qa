class Admin::ProductLinesController < ApplicationController
  load_and_authorize_resource
  before_action :set_product_line, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('product_line_module')
  end
  # GET /admin/product_lines
  # GET /admin/product_lines.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/product_lines/1
  # GET /admin/product_lines/1.json
  def show
    respond_modal_with @product_line
  end

  # GET /admin/product_lines/new
  def new
    @product_line = ProductLine.new
    respond_modal_with @product_line
  end

  # GET /admin/product_lines/1/edit
  def edit
    respond_modal_with @product_line
  end

  # POST /admin/product_lines
  # POST /admin/product_lines.json
  def create
    @product_line = ProductLine.new(product_line_params)

    respond_modal_action_with(@product_line)
  end

  # PATCH/PUT /admin/product_lines/1
  # PATCH/PUT /admin/product_lines/1.json
  def update
    @product_line.attributes =  product_line_params 
    respond_modal_action_with(@product_line)
  end

  def delete
    respond_modal_for_delete_with(@product_line,true)
  end

  # DELETE /admin/product_lines/1
  # DELETE /admin/product_lines/1.json
  def destroy
    @product_line.save!(context: :delete)
  end

  def filter_form
    @q = ProductLine.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = ProductLine.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_line
      @product_line = ProductLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_line_params
      params.require(:product_line).permit(:name, :description, :deleted_at)
    end
end