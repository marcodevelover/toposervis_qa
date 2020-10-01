class ServiceOrderMailer < ApplicationMailer
    def service_order_create
      @service_order = params[:service_order]      
      @email = @service_order.user.email
      mail(to: @email, subject: "TOPOSERVIS - ORDEN DE SERVICIO REGISTRADA - #{@service_order.folio}")
    end
    def service_order_done
      @service_order = params[:service_order]      
      @email = @service_order.user.email
      mail(to: @email, subject: "TOPOSERVIS - ORDEN DE SERVICIO CONCLUIDA - #{@service_order.folio}")
    end
     def service_order_delivered
      @service_order = params[:service_order]      
      @email = @service_order.user.email
      mail(to: @email, subject: "TOPOSERVIS - ORDEN DE SERVICIO FINALIZADA - #{@service_order.folio}")
    end   
end
