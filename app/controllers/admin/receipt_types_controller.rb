class Admin::ReceiptTypesController < ApplicationController
  before_action :set_receipt_type, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = "Tipos de comprobante"
  end
  # GET /admin/receipt_types
  # GET /admin/receipt_types.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/receipt_types/1
  # GET /admin/receipt_types/1.json
  def show
    respond_modal_with @receipt_type
  end

  # GET /admin/receipt_types/new
  def new
    @receipt_type = ReceiptType.new
    respond_modal_with @receipt_type
  end

  # GET /admin/receipt_types/1/edit
  def edit
    respond_modal_with @receipt_type
  end

  # POST /admin/receipt_types
  # POST /admin/receipt_types.json
  def create
    @receipt_type = ReceiptType.new(receipt_type_params)

    respond_modal_action_with(@receipt_type)
  end

  # PATCH/PUT /admin/receipt_types/1
  # PATCH/PUT /admin/receipt_types/1.json
  def update
    @receipt_type.attributes =  receipt_type_params 
    respond_modal_action_with(@receipt_type)
  end

  def delete
    respond_modal_for_delete_with(@receipt_type,true)
  end

  # DELETE /admin/receipt_types/1
  # DELETE /admin/receipt_types/1.json
  def destroy
    @receipt_type.save!(context: :delete)
  end

  def filter_form
    @q = ReceiptType.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = ReceiptType.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt_type
      @receipt_type = ReceiptType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_type_params
      params.require(:receipt_type).permit(:name, :description, :deleted_at)
    end
end
