class Admin::RolesController < ApplicationController
  before_action :set_admin_role, only: [:show, :edit, :update, :destroy]

  # GET /admin/roles
  # GET /admin/roles.json
  def index
    @admin_roles = Role.all
  end

  # GET /admin/roles/1
  # GET /admin/roles/1.json
  def show
  end

  # GET /admin/roles/new
  def new
    @admin_role = Admin::Role.new
  end

  # GET /admin/roles/1/edit
  def edit
  end

  # POST /admin/roles
  # POST /admin/roles.json
  def create
    @admin_role = Admin::Role.new(admin_role_params)

    respond_to do |format|
      if @admin_role.save
        format.html { redirect_to @admin_role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @admin_role }
      else
        format.html { render :new }
        format.json { render json: @admin_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/roles/1
  # PATCH/PUT /admin/roles/1.json
  def update
    respond_to do |format|
      if @admin_role.update(admin_role_params)
        format.html { redirect_to @admin_role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_role }
      else
        format.html { render :edit }
        format.json { render json: @admin_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/roles/1
  # DELETE /admin/roles/1.json
  def destroy
    @admin_role.destroy
    respond_to do |format|
      format.html { redirect_to admin_roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_role
      @admin_role = Admin::Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_role_params
      params.require(:admin_role).permit(:description, :deleted_at)
    end
end
