class Admin::DiagnosisTypesController < ApplicationController
  load_and_authorize_resource
  before_action :set_diagnosis_type, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('diagnosis_type_module')
  end
  # GET /admin/diagnosis_types
  # GET /admin/diagnosis_types.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/diagnosis_types/reports.xlsx.axlsx"}
    end
  end

  # GET /admin/diagnosis_types/1
  # GET /admin/diagnosis_types/1.json
  def show
    respond_modal_with @diagnosis_type
  end

  # GET /admin/diagnosis_types/new
  def new
    @diagnosis_type = DiagnosisType.new
    respond_modal_with @diagnosis_type
  end

  # GET /admin/diagnosis_types/1/edit
  def edit
    respond_modal_with @diagnosis_type
  end

  # POST /admin/diagnosis_types
  # POST /admin/diagnosis_types.json
  def create
    @diagnosis_type = DiagnosisType.new(diagnosis_type_params)

    respond_modal_action_with(@diagnosis_type)
  end

  # PATCH/PUT /admin/diagnosis_types/1
  # PATCH/PUT /admin/diagnosis_types/1.json
  def update
    @diagnosis_type.attributes =  diagnosis_type_params 
    respond_modal_action_with(@diagnosis_type)
  end

  def delete
    respond_modal_for_delete_with(@diagnosis_type,true)
  end

  # DELETE /admin/diagnosis_types/1
  # DELETE /admin/diagnosis_types/1.json
  def destroy
    @diagnosis_type.save!(context: :delete)
  end

  def filter_form
    @q = DiagnosisType.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = DiagnosisType.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnosis_type
      @diagnosis_type = DiagnosisType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnosis_type_params
      params.require(:diagnosis_type).permit(:name, :description, :deleted_at)
    end
end
