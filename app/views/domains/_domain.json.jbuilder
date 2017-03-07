json.extract! domain, :id, :domain, :spf, :dmarc, :txt, :sip, :created_at, :updated_at
json.url domain_url(domain, format: :json)
