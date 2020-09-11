module CustomersHelper


	  # the per_page_dropdown is used on index pages like orders, products, promotions etc.
	  # this method generates the select_tag
	  def per_page_dropdown
	    # there is a config setting for admin_products_per_page, only for the orders page
	    if @products && per_page_default = Spree::Config.admin_products_per_page
	      per_page_options = []
	      5.times do |amount|
	        per_page_options << (amount + 1) * Spree::Config.admin_products_per_page
	      end
	    else
	      per_page_default = 10
	      per_page_options = %w{15 30 45 60}
	    end

	    selected_option = params[:per_page].try(:to_i) || per_page_default

	    select_tag(:per_page,
	               options_for_select(per_page_options, selected_option),
	               class: "form-control pull-right js-per-page-select per-page-selected-#{selected_option}")
	  end
	def per_page_dropdown_params(args = nil)
	  args = params.permit!.to_h.clone
	  args.delete(:page)
	  args.delete(:per_page)
	  args
	end
end
