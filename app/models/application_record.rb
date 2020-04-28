class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_validation :erase , on: :delete 
  def erase	
  	self.deleted_at=Time.now
  end  
end
