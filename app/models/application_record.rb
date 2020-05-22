class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include ActiveStorageSupport::SupportForBase64

  before_validation :erase , on: :delete 
  before_validation :delivered , on: :output 
  def erase	
  	self.deleted_at=Time.now
  end  

  def delivered	
  	self.state="delivered"
  end  
end
