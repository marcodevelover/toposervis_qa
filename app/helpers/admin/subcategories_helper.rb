module Admin::SubcategoriesHelper
	def default_category_type(subcategory)
		subcategory.new_record? ? "" : subcategory.category.category_type_id
	end
end
