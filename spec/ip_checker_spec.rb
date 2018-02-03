require 'spec_helper'
require_relative '../lib/ip_checker'

RSpec.describe IpChecker do
  it 'takes an ip address' do
    expect(described_class.new('5.5.5.5').address).to eq '5.5.5.5'
  end

  describe '#check', :vcr, cassette: 'google' do
    it 'calls HTTParty and returns the response' do
      expect(HTTParty).to receive(:get).with('http://ipinfo.io/8.8.8.8')
      response = IpChecker.new.check
      expect(response['ip']).to eq '8.8.8.8'
      expect(response['loc']).to eq '37.3860,-122.0840'
    end
  end
end
