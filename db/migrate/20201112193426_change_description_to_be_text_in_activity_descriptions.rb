class ChangeDescriptionToBeTextInActivityDescriptions < ActiveRecord::Migration[6.0]
  def change
  	change_column :activity_descriptions, :description, :text
  end
end
