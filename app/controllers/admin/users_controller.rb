class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :delete]
  respond_to :html, :json
  
  def page_name
     @page_name = t('user_module')
  end
  # GET /admin/users
  # GET /admin/users.json
  def index
  	search
    respond_to do |format| 
            format.html { }
            format.js  { respond_modal_index_with (@collection)}
    end
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  	respond_modal_with @user
  end

  # GET /admin/users/new
  def new
    @user = User.new
    respond_modal_with @user
  end

  # GET /admin/users/1/edit
  def edit
  	respond_modal_with @user
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @user = User.new(user_params)

    respond_modal_action_with(@user)
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    if params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation) 
    end 
  	@user.attributes =  user_params 
    respond_modal_action_with(@user)
  end

  def delete
    respond_modal_for_delete_with(@user,true)
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @user.save!(context: :delete)
  end

  def search(per_page = 10)
    params[:q] ||= {} 
    params[:per_page] = 10
    
    @q = User.search(params[:q])
    @collection = @q.result(:distinct => true).page(params[:page]).per(params[:per_page])  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :name, :lastname, :phone, :deleted_at, :role_id)
    end
end
