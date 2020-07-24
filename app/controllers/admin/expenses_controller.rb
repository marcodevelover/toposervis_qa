class Admin::ExpensesController < ApplicationController
  load_and_authorize_resource
  before_action :set_expense, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  def page_name
     @page_name = "Egresos"
  end
  # GET /expenses
  # GET /expenses.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  def show_from_modal
    respond_modal_with @expense
  end
  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)

    if params[:expense][:files].present?
        params[:expense][:files].each do |file|
        @expense.files.attach(file)
      end
    end

    respond_to do |format|
      if @expense.save
        format.html { redirect_to [:admin, @expense], notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to [:admin, @expense], notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end
  def delete
    respond_modal_for_delete_with(@expense,true)
  end
  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.save!(context: :delete)
    @object = @expense
    respond_to do |format|
      search
      @objects= @collection
      format.js  { render "admin/shared/save.js.erb", layout: false, content_type: 'text/javascript' }
    end
  end

  def filter_form
    @q = Expense.ransack(params[:q])
    respond_modal_with @q 
  end
  
  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = Expense.search(params[:q])
    @collection = @q.result(:distinct => true).order('id DESC').page(params[:page]).per(params[:per_page])
  end  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:date, :payment_method_id, :purchase_order, :last_digit, :project, :account_id, :category_type_id, :category_id, :provider_id, :document_type_id, :folio, :comment, :concept, :deleted_at,
        expense_amount_attributes: [:id, :expense_id, :total, :iva, :ieps, :total_with_tax],
        files_attachments_attributes: [:id, :_destroy]
        )
    end
end
