class Admin::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json

  def page_name
     @page_name = t('customer_module')
  end
  # GET /customers
  # GET /customers.json

  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    respond_modal_with @customer
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    respond_modal_with @customer
  end

  # GET /customers/1/edit
  def edit
    respond_modal_with @customer
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_modal_action_with(@customer)
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @customer.attributes =  customer_params 
    respond_modal_action_with(@customer)
  end

  def delete
    respond_modal_for_delete_with(@customer,true)
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.save!(context: :delete)
  end

  def filter_form
    @q = Customer.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Customer.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(
        :name, :rfc, :business_name, :deleted_at, 
        customer_address_attributes: [ :id, :street, :number, :crossing, :postcode, :colony, :town, :state, :country, :deleted_at ],
        customer_contacts_attributes: [ :id, :name, :department, :phone, :extension, :cellphone, :email, :_destroy ],
        customer_bank_attributes: [ :id, :beneficiary ]
        )
    end
end
