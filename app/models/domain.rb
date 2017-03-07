class Domain < ActiveRecord::Base
 
  require 'resolv'

  def domain_valid?(domain)
    Resolv::DNS.open do |dns|
      @mx = dns.getresources(domain.to_s, Resolv::DNS::Resource::IN::MX)
    end
    if @mx.empty?
      errors_add(:email, 'domain name can not be found.')
    end
  end

end

