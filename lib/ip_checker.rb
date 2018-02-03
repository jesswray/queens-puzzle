require 'httparty'

class IpChecker
  attr_reader :address

  def initialize(ip)
    @address = ip || '8.8.8.8'
    puts "Initialized with #{@address}"
  end

  def latitude
    geodata = check['loc']
    fail 'Are you sure that place exists?' unless geodata
    geodata.split(',').first.to_i
  end

  def check
    response = HTTParty.get('http://ipinfo.io/8.8.8.8')
    fail 'Whoops, are you connected to the Internet?' unless response
    response
  end
end
