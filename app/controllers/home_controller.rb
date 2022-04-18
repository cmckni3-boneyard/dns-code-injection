class HomeController < ApplicationController
  def index
    domain_name = 'google.com'
    
    Resolv::DNS.open do |dns|
      txt_records = dns.getresources domain_name, Resolv::DNS::Resource::IN::TXT
      @dns_content = txt_records.map(&:strings).reject { |record| record.include?('keybase') }.join('')
    end
  end
end
