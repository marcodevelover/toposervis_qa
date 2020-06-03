class UseOfCfdisController < ApplicationController
  before_action :set_use_of_cfdi, only: [:show, :edit, :update, :destroy]

  # GET /use_of_cfdis
  # GET /use_of_cfdis.json
  def index
    @use_of_cfdis = UseOfCfdi.all
  end

  # GET /use_of_cfdis/1
  # GET /use_of_cfdis/1.json
  def show
  end

  # GET /use_of_cfdis/new
  def new
    @use_of_cfdi = UseOfCfdi.new
  end

  # GET /use_of_cfdis/1/edit
  def edit
  end

  # POST /use_of_cfdis
  # POST /use_of_cfdis.json
  def create
    @use_of_cfdi = UseOfCfdi.new(use_of_cfdi_params)

    respond_to do |format|
      if @use_of_cfdi.save
        format.html { redirect_to @use_of_cfdi, notice: 'Use of cfdi was successfully created.' }
        format.json { render :show, status: :created, location: @use_of_cfdi }
      else
        format.html { render :new }
        format.json { render json: @use_of_cfdi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /use_of_cfdis/1
  # PATCH/PUT /use_of_cfdis/1.json
  def update
    respond_to do |format|
      if @use_of_cfdi.update(use_of_cfdi_params)
        format.html { redirect_to @use_of_cfdi, notice: 'Use of cfdi was successfully updated.' }
        format.json { render :show, status: :ok, location: @use_of_cfdi }
      else
        format.html { render :edit }
        format.json { render json: @use_of_cfdi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /use_of_cfdis/1
  # DELETE /use_of_cfdis/1.json
  def destroy
    @use_of_cfdi.destroy
    respond_to do |format|
      format.html { redirect_to use_of_cfdis_url, notice: 'Use of cfdi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_use_of_cfdi
      @use_of_cfdi = UseOfCfdi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def use_of_cfdi_params
      params.require(:use_of_cfdi).permit(:cfdi_key, :descripcion, :persona_fisica, :persona_moral)
    end
end
