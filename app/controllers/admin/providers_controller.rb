class Admin::ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json

  def page_name
     @page_name = t('provider_module')
  end
  # GET /providers
  # GET /providers.json

  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    respond_modal_with @provider
  end

  # GET /providers/new
  def new
    @provider = Provider.new
    #@account.users.build
    #@provider.provider_address.build
    respond_modal_with @provider
  end

  # GET /providers/1/edit
  def edit
    respond_modal_with @provider
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)

    respond_modal_action_with(@provider)
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    @provider.attributes =  provider_params 
    respond_modal_action_with(@provider)
  end

  def delete
    respond_modal_for_delete_with(@provider,true)
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.save!(context: :delete)
  end

  def filter_form
    @q = Provider.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Provider.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(
        :name, :rfc, :business_name, :deleted_at, 
        provider_address_attributes: [ :id, :street, :number, :crossing, :postcode, :colony, :town, :state, :country, :deleted_at ],
        provider_contacts_attributes: [ :id, :name, :department, :phone, :extension, :cellphone, :email, :_destroy ],
        provider_bank_attributes: [ :id, :beneficiary ]
        )
    end
end
