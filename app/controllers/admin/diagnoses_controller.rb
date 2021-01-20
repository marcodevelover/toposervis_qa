class Admin::DiagnosesController < ApplicationController
  load_and_authorize_resource
  before_action :set_diagnosis, only: [:show, :edit, :update, :destroy, :show_from_pdf, :output_pdf, :note_from_pdf]

  # GET /diagnoses
  # GET /diagnoses.json
  def index
    @diagnoses = Diagnosis.all
  end

  # GET /diagnoses/1
  # GET /diagnoses/1.json
  def show
  end

  def show_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "diagnostico_" + @diagnosis.service_order.folio,
            header:  {   html: {   template: "admin/diagnoses/header_pdf.html.erb"}},
            template: "admin/diagnoses/show_from_pdf.html.erb",
            
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                         },
            footer:  {   html: {   template: "admin/diagnoses/footer_pdf.html.erb"}}
        end
    end
  end

  def output_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "orden_salida_" + @diagnosis.service_order.folio,
            
            template: "admin/diagnoses/output_pdf.html.erb",
            
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                         },
            footer:  {   html: {   template: "admin/diagnoses/footer_pdf.html.erb"}}
        end
    end
  end

  def note_from_pdf
    respond_to do |format|
        format.html
        format.pdf do
            render pdf: "nota_de_venta_" + @diagnosis.service_order.folio,
            #header:  {   html: {   template: "admin/diagnoses/note_header_pdf.html.erb"}},
            template: "admin/diagnoses/note_from_pdf.html.erb",
            
            layout: "pdf.html",
            viewport_size: '1280x1024',
            margin:  {   
                         bottom: 40,
                         
                         }
            #footer:  {   html: {   template: "admin/diagnoses/footer_pdf.html.erb"}}
        end
    end
  end

  # GET /diagnoses/new
  def new
    @diagnosis = Diagnosis.new
  end

  # GET /diagnoses/1/edit
  def edit
  end

  # POST /diagnoses
  # POST /diagnoses.json
  def create
    @diagnosis = Diagnosis.new(diagnosis_params)

    respond_to do |format|
      if @diagnosis.save
        format.html { redirect_to @diagnosis, notice: 'Diagnosis was successfully created.' }
        format.json { render :show, status: :created, location: @diagnosis }
      else
        format.html { render :new }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diagnoses/1
  # PATCH/PUT /diagnoses/1.json
  def update
    respond_to do |format|
      if @diagnosis.update(diagnosis_params)
        format.html { redirect_to @diagnosis, notice: 'Diagnosis was successfully updated.' }
        format.json { render :show, status: :ok, location: @diagnosis }
      else
        format.html { render :edit }
        format.json { render json: @diagnosis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnoses/1
  # DELETE /diagnoses/1.json
  def destroy
    @diagnosis.destroy
    respond_to do |format|
      format.html { redirect_to diagnoses_url, notice: 'Diagnosis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnosis
      @diagnosis = Diagnosis.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnosis_params
      params.require(:diagnosis).permit(:service_order_id, :date, :delivery_time, :date_delivery, :diagnosis_type_id)
    end
end
