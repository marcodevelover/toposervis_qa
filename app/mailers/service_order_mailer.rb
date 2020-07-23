class ServiceOrderMailer < ApplicationMailer
    def service_order_done
      @service_order = params[:service_order]      
      @email = @service_order.customer.customer_contacts.first.email
      mail(to: @email, subject: "Orden de servicio concluida - #{@service_order.folio}")
    end
end
