class HomeController < ApplicationController
  def index
    Resolv::DNS.open do |dns|
      txt_records = dns.getresources 'cmcknight.io', Resolv::DNS::Resource::IN::TXT
      @dns_content = txt_records.map(&:strings).reject { |record| record.include?('keybase') }.join('')
    end
  end
end
