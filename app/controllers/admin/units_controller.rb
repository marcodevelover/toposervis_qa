class Admin::UnitsController < ApplicationController
  load_and_authorize_resource
  before_action :set_unit, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('unit_module')
  end
  # GET /admin/units
  # GET /admin/units.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/units/1
  # GET /admin/units/1.json
  def show
    respond_modal_with @unit
  end

  # GET /admin/units/new
  def new
    @unit = Unit.new
    respond_modal_with @unit
  end

  # GET /admin/units/1/edit
  def edit
    respond_modal_with @unit
  end

  # POST /admin/units
  # POST /admin/units.json
  def create
    @unit = Unit.new(unit_params)

    respond_modal_action_with(@unit)
  end

  # PATCH/PUT /admin/units/1
  # PATCH/PUT /admin/units/1.json
  def update
    @unit.attributes =  unit_params 
    respond_modal_action_with(@unit)
  end

  def delete
    respond_modal_for_delete_with(@unit,true)
  end

  # DELETE /admin/units/1
  # DELETE /admin/units/1.json
  def destroy
    @unit.save!(context: :delete)
  end

  def filter_form
    @q = Unit.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Unit.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:name, :description, :abbreviation, :unit_key, :deleted_at)
    end
end