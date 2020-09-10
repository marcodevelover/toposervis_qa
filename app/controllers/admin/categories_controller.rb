class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('category_module')
  end
  # GET /admin/categories
  # GET /admin/categories.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/categories/reports.xlsx.axlsx"}
    end
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
    respond_modal_with @category
  end

  # GET /admin/categories/new
  def new
    @category = Category.new
    respond_modal_with @category
  end

  # GET /admin/categories/1/edit
  def edit
    respond_modal_with @category
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @category = Category.new(category_params)

    respond_modal_action_with(@category)
  end

  # PATCH/PUT /admin/categories/1
  # PATCH/PUT /admin/categories/1.json
  def update
    @category.attributes =  category_params 
    respond_modal_action_with(@category)
  end

  def delete
    respond_modal_for_delete_with(@category,true)
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @category.save!(context: :delete)
  end

  def filter_form
    @q = Category.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Category.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :category_type_id, :deleted_at)
    end
end