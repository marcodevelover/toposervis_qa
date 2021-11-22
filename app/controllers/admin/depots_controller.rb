class Admin::DepotsController < ApplicationController
  load_and_authorize_resource
  before_action :set_depot, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('depot_module')
  end
  # GET /admin/depots
  # GET /admin/depots.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/depots/reports.xlsx.axlsx"}
    end
  end

  # GET /admin/depots/1
  # GET /admin/depots/1.json
  def show
    respond_modal_with @depot
  end

  # GET /admin/depots/new
  def new
    @depot = Depot.new
    respond_modal_with @depot
  end

  # GET /admin/depots/1/edit
  def edit
    respond_modal_with @depot
  end

  # POST /admin/depots
  # POST /admin/depots.json
  def create
    @depot = Depot.new(depot_params)

    respond_modal_action_with(@depot)
  end

  # PATCH/PUT /admin/depots/1
  # PATCH/PUT /admin/depots/1.json
  def update
    @depot.attributes =  depot_params 
    respond_modal_action_with(@depot)
  end

  def delete
    respond_modal_for_delete_with(@depot,true)
  end

  # DELETE /admin/depots/1
  # DELETE /admin/depots/1.json
  def destroy
    @depot.save!(context: :delete)
  end

  def filter_form
    @q = Depot.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Depot.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_depot
      @depot = Depot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def depot_params
      params.require(:depot).permit(:name, :description, :boolean, :deleted_at)
    end
end