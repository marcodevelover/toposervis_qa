class Admin::BillPaymentController < ApplicationController
  before_action :set_sale, only: [:show, :download_pdf, :download_xml, :download_zip]
  respond_to :html, :json
  
  def page_name
     @page_name = "Complemento de pago"
  end	
  # GET /sales
  # GET /sales.json
  
  def index
    search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
            format.xlsx {render xlsx: "reports", template: "admin/sales/reports.xlsx.axlsx"}
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    respond_modal_with @sale
  end

  def filter_form
    @q = Sale.ransack(params[:q])
    respond_modal_with @q 
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    ######params[:per_page] = 10
    
    @q = Sale.where(payment_way_id: 2).search(params[:q])
    @collection = @q.result(:distinct => true).order('id DESC').page(params[:page]).per(params[:per_page])  
  end

  def download_pdf
    pdf = FacturapiRuby::Files.pdf(invoice_id: @sale.bill_key)
    send_file pdf.path
    pdf.close
  end  

  def download_xml
    xml = FacturapiRuby::Files.xml(invoice_id: @sale.bill_key)
    send_file xml.path
    xml.close
  end 

  def download_zip
    zip = FacturapiRuby::Files.zip(invoice_id: @sale.bill_key)
    send_file zip.path
    zip.close
  end      

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end
end
