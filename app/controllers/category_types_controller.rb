class CategoryTypesController < ApplicationController
  before_action :set_category_type, only: [:show, :edit, :update, :destroy]

  # GET /category_types
  # GET /category_types.json
  def index
    @category_types = CategoryType.all
  end

  # GET /category_types/1
  # GET /category_types/1.json
  def show
  end

  # GET /category_types/new
  def new
    @category_type = CategoryType.new
  end

  # GET /category_types/1/edit
  def edit
  end

  # POST /category_types
  # POST /category_types.json
  def create
    @category_type = CategoryType.new(category_type_params)

    respond_to do |format|
      if @category_type.save
        format.html { redirect_to @category_type, notice: 'Category type was successfully created.' }
        format.json { render :show, status: :created, location: @category_type }
      else
        format.html { render :new }
        format.json { render json: @category_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_types/1
  # PATCH/PUT /category_types/1.json
  def update
    respond_to do |format|
      if @category_type.update(category_type_params)
        format.html { redirect_to @category_type, notice: 'Category type was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_type }
      else
        format.html { render :edit }
        format.json { render json: @category_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_types/1
  # DELETE /category_types/1.json
  def destroy
    @category_type.destroy
    respond_to do |format|
      format.html { redirect_to category_types_url, notice: 'Category type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_type
      @category_type = CategoryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_type_params
      params.require(:category_type).permit(:name, :description, :deleted_at)
    end
end
