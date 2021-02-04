class Admin::ConditionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_condition, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = "Términos y condiciones"
  end
  # GET /admin/conditions
  # GET /admin/conditions.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/conditions/reports.xlsx.axlsx"}
    end
  end

  # GET /admin/conditions/1
  # GET /admin/conditions/1.json
  def show
    respond_modal_with @condition
  end

  # GET /admin/conditions/new
  def new
    @condition = Condition.new
    respond_modal_with @condition
  end

  # GET /admin/conditions/1/edit
  def edit
    respond_modal_with @condition
  end

  # POST /admin/conditions
  # POST /admin/conditions.json
  def create
    @condition = Condition.new(condition_params)

    respond_modal_action_with(@condition)
  end

  # PATCH/PUT /admin/conditions/1
  # PATCH/PUT /admin/conditions/1.json
  def update
    @condition.attributes =  condition_params 
    respond_modal_action_with(@condition)
  end

  def delete
    respond_modal_for_delete_with(@condition,true)
  end

  # DELETE /admin/conditions/1
  # DELETE /admin/conditions/1.json
  def destroy
    @condition.save!(context: :delete)
  end

  def filter_form
    @q = Condition.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Condition.active.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condition
      @condition = Condition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condition_params
      params.require(:condition).permit(:name, :description, :default, :deleted_at)
    end
end
