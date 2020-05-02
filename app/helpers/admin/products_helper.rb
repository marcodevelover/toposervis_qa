module Admin::ProductsHelper
	def create_carousel(images)
		images.each_slice(4).with_index do |images_items,index|
			if index == 0
				concat carousel_container_item(images_items,true) 
			else
				concat carousel_container_item(images_items,false) 
			end
		end
	end

	def carousel_container_item(images,active)
		content_tag(:div, class: active ? "carousel-item active" : "carousel-item") do
			content_tag(:div,class: "row") do
				create_carousel_image(images)
			end
		end
	end

	def create_carousel_image(images)
		images.each do |image|
			concat content_tag(:div,image_tag(image.image,class: "img-fluid item-img"),class: 'col-md-3 col-3')
		end
	end
end
