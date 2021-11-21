class ServiceOrderMailer < ApplicationMailer
    def service_order_create
      @service_order = params[:service_order]      
      @email = @service_order.user.email
      mail(to: @email, subject: "Orden de servicio registrada - #{@service_order.folio}")
    end
    def service_order_done
      @service_order = params[:service_order]      
      @email = @service_order.user.email
      mail(to: @email, subject: "Orden de servicio concluida - #{@service_order.folio}")
    end
     def service_order_delivered
      @service_order = params[:service_order]      
      @email = @service_order.user.email
      mail(to: @email, subject: "Orden de servicio finalizada - #{@service_order.folio}")
    end   
end
