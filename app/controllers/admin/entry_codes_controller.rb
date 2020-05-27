class Admin::EntryCodesController < ApplicationController
  before_action :set_entry_code, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = "Códigos de entrada"
  end
  # GET /admin/entry_codes
  # GET /admin/entry_codes.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/entry_codes/1
  # GET /admin/entry_codes/1.json
  def show
    respond_modal_with @entry_code
  end

  # GET /admin/entry_codes/new
  def new
    @entry_code = EntryCode.new
    respond_modal_with @entry_code
  end

  # GET /admin/entry_codes/1/edit
  def edit
    respond_modal_with @entry_code
  end

  # POST /admin/entry_codes
  # POST /admin/entry_codes.json
  def create
    @entry_code = EntryCode.new(entry_code_params)

    respond_modal_action_with(@entry_code)
  end

  # PATCH/PUT /admin/entry_codes/1
  # PATCH/PUT /admin/entry_codes/1.json
  def update
    @entry_code.attributes =  entry_code_params 
    respond_modal_action_with(@entry_code)
  end

  def delete
    respond_modal_for_delete_with(@entry_code,true)
  end

  # DELETE /admin/entry_codes/1
  # DELETE /admin/entry_codes/1.json
  def destroy
    @entry_code.save!(context: :delete)
  end

  def filter_form
    @q = EntryCode.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = EntryCode.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_code
      @entry_code = EntryCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_code_params
      params.require(:entry_code).permit(:name, :description, :deleted_at)
    end
end
