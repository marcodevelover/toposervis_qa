class Admin::DeliverablesController < ApplicationController
  load_and_authorize_resource
  before_action :set_deliverable, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('deliverable_module')
  end
  # GET /admin/deliverables
  # GET /admin/deliverables.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/deliverables/reports.xlsx.axlsx"}
    end
  end

  # GET /admin/deliverables/1
  # GET /admin/deliverables/1.json
  def show
    respond_modal_with @deliverable
  end

  # GET /admin/deliverables/new
  def new
    @deliverable = Deliverable.new
    respond_modal_with @deliverable
  end

  # GET /admin/deliverables/1/edit
  def edit
    respond_modal_with @deliverable
  end

  # POST /admin/deliverables
  # POST /admin/deliverables.json
  def create
    @deliverable = Deliverable.new(deliverable_params)

    respond_modal_action_with(@deliverable)
  end

  # PATCH/PUT /admin/deliverables/1
  # PATCH/PUT /admin/deliverables/1.json
  def update
    @deliverable.attributes =  deliverable_params 
    respond_modal_action_with(@deliverable)
  end

  def delete
    respond_modal_for_delete_with(@deliverable,true)
  end

  # DELETE /admin/deliverables/1
  # DELETE /admin/deliverables/1.json
  def destroy
    @deliverable.save!(context: :delete)
  end

  def filter_form
    @q = Deliverable.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Deliverable.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliverable
      @deliverable = Deliverable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deliverable_params
      params.require(:deliverable).permit(:name, :description, :deleted_at)
    end
end