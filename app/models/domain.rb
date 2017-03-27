class Domain < ActiveRecord::Base
   
   validates :domain, presence: true 
   def self.search(search)
   where("domain LIKE ? OR spf LIKE ? OR dmarc LIKE ?  OR txt LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
   end
    
end

