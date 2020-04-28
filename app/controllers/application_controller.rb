class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :page_name
  before_action :page_description
  layout :layout_by_resource
  
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
  
  def respond_modal_for_delete_with(*args)
    #arguments: object, is_soft_delete
    @object =  args[0] 
    respond_to do |format| 

            search
            @objects=  @collection
            format.js  { render "admin/shared/delete.js.erb", layout: false, content_type: 'text/javascript' }
         

           
      end
  end

  def respond_modal_with(*args, &blk)
    @object= args[0]
      options = args.extract_options!
      options[:responder] = ModalResponder
      respond_with *args, options, &blk
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
