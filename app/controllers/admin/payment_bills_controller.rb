class Admin::PaymentBillsController < ApplicationController
  load_and_authorize_resource
  before_action :set_payment_bill, only: [:show, :edit, :update, :destroy, :delete, :show_from_modal, :show_from_pdf, :note_from_pdf, :bill, :invoice, :cancel_invoice, :request_cancellation_state_invoice, :cancellation_state_invoice,:download_pdf, :download_xml, :download_zip]
  respond_to :html, :json

  def page_name
     @page_name = "Complementos de pago"
  end
  # GET /payment_bills
  # GET /payment_bills.json
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/payment_bills/reports.xlsx.axlsx"}
    end
  end

  # GET /payment_bills/1
  # GET /payment_bills/1.json
  def show    
  end

  def show_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "orden_venta_" + @payment_bill.sale.folio,
            
            template: "admin/payment_bills/show_from_pdf.html.erb",
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                         },
            footer:  {   html: {   template: "admin/payment_bills/footer_pdf.html.erb"}}
        end
    end
  end

  def note_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "nota_de_venta_" + @payment_bill.sale.folio,
            template: "admin/payment_bills/note_from_pdf.html.erb",
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                      }
            #footer:  {   html: {   template: "admin/quotations/footer_pdf.html.erb"}}
        end
    end
  end

  def show_from_modal
    respond_modal_with @payment_bill
  end
  # GET /payment_bills/new
  def new
    @payment_bill = PaymentBill.new
    #@sale = @payment_bill.build_sale
  end

  # GET /payment_bills/1/edit
  def edit
  end

  # POST /payment_bills
  # POST /payment_bills.json
  def create
    @payment_bill = @payment_bill || PaymentBill.new(payment_bill_params)
    @payment_bill.unpaid_balance_amount = params[:payment_bill][:previous_balance_amount].to_f - params[:payment_bill][:amount_paid].to_f
    respond_to do |format|
      if @payment_bill.save
        format.html { redirect_to [:admin, @payment_bill], notice: 'payment_bill was successfully created.' }
        format.json { render :show, status: :created, location: @payment_bill }
      else
        format.html { render :new }
        format.json { render json: @payment_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_bills/1
  # PATCH/PUT /payment_bills/1.json
  def update
    respond_to do |format|
      if @payment_bill.update(payment_bill_params)
        format.html { redirect_to [:admin, @payment_bill], notice: 'payment_bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_bill }
      else
        format.html { render :edit }
        format.json { render json: @payment_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    respond_modal_for_delete_with(@payment_bill,true)
  end

  # DELETE /payment_bills/1
  # DELETE /payment_bills/1.json
  def destroy
    @payment_bill.save!(context: :delete)
    @object = @payment_bill
    respond_to do |format|
      search
      @objects= @collection
      format.js  { render "admin/shared/save.js.erb", layout: false, content_type: 'text/javascript' }
    end
  end

  def customers
    @q = Customer.active.ransack(params[:q])
    @customers = @q.result(distinct: true)
    total_count = @customers.count
    respond_to do |format|
      format.json { render json: { total: total_count,  customers: @customers.map { |s| {id: s.id, name:  s.name, rfc: s.rfc, business_name: s.business_name } } } }
    end
  end

  def product_variants
    @q = ProductVariant.select('product_variants.*, product_stocks.serial_number').left_outer_joins(:product_stocks).where("product_stocks.status IS NULL").where("products.deleted_at IS NULL").where("products.available_for_sale != 0").ransack(params[:q])
    @product_variants = @q.result(distinct: true)
    #total_count = @product_variants.count
    respond_to do |format|
      format.json { render json: {   product_variants: @product_variants.map { |s| {id: s.id, code:  s.code, required_serial_number: s.product.required_serial_number, product_name: s.product.name, product_model: s.product.model, product_brand: s.product.brand, unit_price: s.amount_public, exchange_name: s.currency.name, exchange_rate: s.currency.exchange_rate, unit: s.product.unit.name, stock: s.stock_item.stock, image: s.first_image, serial_number: s.serial_number} } } }
    end
  end

  def product_stocks
    @q = ProductStock.ransack(params[:q])
    @product_stocks = @q.result(distinct: true)
    total_count = @product_stocks.count
    respond_to do |format|
      format.json { render json: { total: total_count,  product_stocks: @product_stocks.map { |s| {id: s.id, product_variant_id: s.product_variant.id, required_serial_number: s.product_variant.product.required_serial_number, serial_number:  s.serial_number, code: s.product_variant.code, product_name: s.product_variant.product.name, product_model: s.product_variant.product.model, product_brand: s.product_variant.product.brand, unit_price: s.product_variant.amount_public, exchange_name: s.product_variant.currency.name, exchange_rate: s.product_variant.currency.exchange_rate, unit: s.product_variant.product.unit.name } } } }
    end
  end

  def sales
    @q = Sale.ransack(params[:q])
    @sales = @q.result(distinct: true).includes(:payment_bills).where(payment_way_id: 2).where(is_due: true)
    total_count = @sales.count
    respond_to do |format|
      format.json { render json: { total: total_count, sales: @sales.map { |s| {id: s.id, folio:  s.folio, partiality_number:  s.payment_bills.blank? ? "0" : s.payment_bills.last.partiality_number, previous_balance_amount: s.payment_bills.blank? ? (s.record.total - s.record.adjustment_total) : s.payment_bills.last.unpaid_balance_amount, } } } }
    end
  end

  def currencies
    @q = Currency.ransack(params[:q])
    @currencies = @q.result(distinct: true)
    total_count = @currencies.count
    respond_to do |format|
      format.json { render json: { total: total_count,  currencies: @currencies.map { |s| {id: s.id, name:  s.name, description:  s.description, abbreviation:  s.abbreviation, exchange_rate: s.exchange_rate } } } }
    end
  end

  def filter_form
    @q = PaymentBill.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    #####params[:per_page] = 10
    
    @q = PaymentBill.search(params[:q])
    @collection = @q.result(:distinct => true).includes(:sale).order('id DESC').page(params[:page]).per(params[:per_page])
  end

  def bill
    respond_modal_for_bill_with(@payment_bill,true)
  end

  # PUT /payment_bills/1
  def invoice
    @payment_bill.save!(context: :payment_bill)
  end

  def request_cancel_invoice
    respond_modal_for_request_cancel_invoice_with(@payment_bill,true)
  end  

  def cancel_invoice
    @payment_bill.save!(context: :request_cancel_invoice)
  end

  def request_cancellation_state_invoice
    respond_modal_for_request_cancellation_state_invoice_with(@payment_bill,true)
  end  

  def cancellation_state_invoice
    @payment_bill.save!(context: :request_cancellation_state_invoice)
  end

  def download_pdf
    pdf = FacturapiRuby::Files.pdf(invoice_id: @payment_bill.bill_key)
    send_file pdf.path
    pdf.close
  end  

  def download_xml
    xml = FacturapiRuby::Files.xml(invoice_id: @payment_bill.bill_key)
    send_file xml.path
    xml.close
  end 

  def download_zip
    zip = FacturapiRuby::Files.zip(invoice_id: @payment_bill.bill_key)
    send_file zip.path
    zip.close
  end   

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_bill
      @payment_bill = PaymentBill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_bill_params
      params.require(:payment_bill).permit(:payment_method_id, :payment_way_id, :sale_id, :total_amount, :payment_date, :partiality_number, 
        :previous_balance_amount, :amount_paid, :unpaid_balance_amount, :deleted_at)
    end
end
