require 'httparty'

class IpChecker
  attr_reader :address

  def initialize(ip='8.8.8.8')
    @address = ip
  end

  def check
    puts HTTParty.get('http://ipinfo.io/8.8.8.8')
  end
end

IpChecker.new.check
