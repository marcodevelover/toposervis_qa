class Admin::SubcategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('subcategory_module')
  end
  # GET /admin/subcategories
  # GET /admin/subcategories.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/subcategories/1
  # GET /admin/subcategories/1.json
  def show
    respond_modal_with @subcategory
  end

  # GET /admin/subcategories/new
  def new
    @subcategory = Subcategory.new
    respond_modal_with @subcategory
  end

  # GET /admin/subcategories/1/edit
  def edit
    respond_modal_with @subcategory
  end

  # POST /admin/subcategories
  # POST /admin/subcategories.json
  def create
    @subcategory = Subcategory.new(subcategory_params)

    respond_modal_action_with(@subcategory)
  end

  # PATCH/PUT /admin/subcategories/1
  # PATCH/PUT /admin/subcategories/1.json
  def update
    @subcategory.attributes =  subcategory_params 
    respond_modal_action_with(@subcategory)
  end

  def delete
    respond_modal_for_delete_with(@subcategory,true)
  end

  # DELETE /admin/subcategories/1
  # DELETE /admin/subcategories/1.json
  def destroy
    @subcategory.save!(context: :delete)
  end

  def filter_form
    @q = Subcategory.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Subcategory.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  def categories
    @q = Category.ransack(params[:q])
    @categories = @q.result(distinct: true)
    total_count = @categories.count
    respond_to do |format|
      format.json { render json: { total: total_count,  categories: @categories.map { |s| {id: s.id, text:  s.name } } } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcategory_params
      params.require(:subcategory).permit(:name, :description, :category_id, :deleted_at)
    end
end