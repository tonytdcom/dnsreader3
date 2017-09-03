class Domain < ActiveRecord::Base
   
   validates :domain, presence: true 
   def self.search(search)
   where("domain LIKE ? OR spf LIKE ? OR dmarc LIKE ?  OR txt LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
   end
   scope :forces, -> { where(txt: 'force') }
   scope :spf, -> { where.not(spf: "")}
   scope :dmarc, -> { where.not(dmarc: "")}
   scope :sip, -> { where.not(sip: "")}
   scope :mx, -> { where.not(mx: "")}
end

