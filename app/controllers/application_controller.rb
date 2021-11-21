class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, prepend: true
  before_action :authenticate_user!
  before_action :page_name
  before_action :page_description
  layout :layout_by_resource
	
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def dashboard
  end

  def page_description
    @page_description = ''
  end

  def page_name
    @page_name = ''
  end

  def respond_modal_index_with(objects)
   @objects= objects 
    respond_to do |format|
      format.js { render "admin/shared/index.js.erb", layout: false, content_type: 'text/javascript' }
    end
  end

  def respond_modal_action_with(object)
    @object = object
    respond_to do |format|
          if @object.save  
            search
            @objects= @collection
            format.js  { render "admin/shared/save.js.erb", layout: false, content_type: 'text/javascript' }
          else 
            format.js { render "admin/shared/error.js.erb", layout: false, content_type: 'text/javascript' }

           end
      end
  end

  def respond_modal_action_with_hide(object)
    @object = object
    respond_to do |format|
          if @object.save  
            search
            @objects= @collection
            format.js  { render "admin/shared/hide.js.erb", layout: false, content_type: 'text/javascript' }
          else 
            format.js { render "admin/shared/error.js.erb", layout: false, content_type: 'text/javascript' }

           end
      end
  end
  
  def respond_modal_for_delete_with(*args)
    #arguments: object, is_soft_delete
    @object =  args[0] 
    respond_to do |format| 

            search
            @objects=  @collection
            format.js  { render "admin/shared/delete.js.erb", layout: false, content_type: 'text/javascript' }
         

           
      end
  end

  def respond_modal_for_output_with(*args)
    @object =  args[0] 
    respond_to do |format| 

            search
            @objects=  @collection
            format.js  { render "admin/shared/output.js.erb", layout: false, content_type: 'text/javascript' }
      end
  end

  def respond_modal_for_bill_with(*args)
    @object =  args[0] 
    respond_to do |format| 

            search
            @objects=  @collection
            format.js  { render "admin/shared/bill.js.erb", layout: false, content_type: 'text/javascript' }
      end
  end

  def respond_modal_for_request_cancel_invoice_with(*args)
    @object =  args[0] 
    respond_to do |format| 

            search
            @objects=  @collection
            format.js  { render "admin/shared/cancel_bill.js.erb", layout: false, content_type: 'text/javascript' }
      end
  end 

  def respond_modal_for_request_cancellation_state_invoice_with(*args)
    @object =  args[0] 
    respond_to do |format| 

            search
            @objects=  @collection
            format.js  { render "admin/shared/cancellation_state_bill.js.erb", layout: false, content_type: 'text/javascript' }
      end
  end    

  def respond_modal_with(*args, &blk)
    @object= args[0]
      options = args.extract_options!
      options[:responder] = ModalResponder
      respond_with *args, options, &blk
  end  

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.role.name = "admin"
      flash[:alert] = "You are not authorized to access this resource!"
      redirect_to root_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_path, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }      
    end
    
  end

  def after_sign_in_path_for(resource)
    if current_user and ( current_user.role.name == "customer")
      admin_service_orders_path
    else
      admin_root_path
    end
  end  

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end


end
