class Admin::AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('accessory_module')
  end
  # GET /admin/accessories
  # GET /admin/accessories.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/accessories/1
  # GET /admin/accessories/1.json
  def show
    respond_modal_with @accessory
  end

  # GET /admin/accessories/new
  def new
    @accessory = Accessory.new
    respond_modal_with @accessory
  end

  # GET /admin/accessories/1/edit
  def edit
    respond_modal_with @accessory
  end

  # POST /admin/accessories
  # POST /admin/accessories.json
  def create
    @accessory = Accessory.new(accessory_params)

    respond_modal_action_with(@accessory)
  end

  # PATCH/PUT /admin/accessories/1
  # PATCH/PUT /admin/accessories/1.json
  def update
    @accessory.attributes =  accessory_params 
    respond_modal_action_with(@accessory)
  end

  def delete
    respond_modal_for_delete_with(@accessory,true)
  end

  # DELETE /admin/accessories/1
  # DELETE /admin/accessories/1.json
  def destroy
    @accessory.save!(context: :delete)
  end

  def filter_form
    @q = Accessory.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Accessory.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accessory
      @accessory = Accessory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accessory_params
      params.require(:accessory).permit(:name, :description, :deleted_at)
    end
end