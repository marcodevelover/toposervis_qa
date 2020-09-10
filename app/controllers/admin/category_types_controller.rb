class Admin::CategoryTypesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category_type, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('category_type_module')
  end
  # GET /admin/category_types
  # GET /admin/category_types.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/category_types/reports.xlsx.axlsx"}
    end
  end

  # GET /admin/category_types/1
  # GET /admin/category_types/1.json
  def show
    respond_modal_with @category_type
  end

  # GET /admin/category_types/new
  def new
    @category_type = CategoryType.new
    respond_modal_with @category_type
  end

  # GET /admin/category_types/1/edit
  def edit
    respond_modal_with @category_type
  end

  # POST /admin/category_types
  # POST /admin/category_types.json
  def create
    @category_type = CategoryType.new(category_type_params)

    respond_modal_action_with(@category_type)
  end

  # PATCH/PUT /admin/category_types/1
  # PATCH/PUT /admin/category_types/1.json
  def update
    @category_type.attributes =  category_type_params 
    respond_modal_action_with(@category_type)
  end

  def delete
    respond_modal_for_delete_with(@category_type,true)
  end

  # DELETE /admin/category_types/1
  # DELETE /admin/category_types/1.json
  def destroy
    @category_type.save!(context: :delete)
  end

  def filter_form
    @q = CategoryType.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = CategoryType.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_type
      @category_type = CategoryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_type_params
      params.require(:category_type).permit(:name, :description, :deleted_at)
    end
end