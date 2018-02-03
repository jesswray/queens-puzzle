require 'spec_helper'
require_relative '../lib/ip_checker'

RSpec.describe IpChecker do
  it 'takes an ip address' do
    expect(described_class.new('5.5.5.5').address).to eq '5.5.5.5'
  end

  describe '.check' do
    before do
      allow(HTTParty).to receive(:get).with('http://ipinfo.io/8.8.8.8') {
        {
          'ip' => '8.8.8.8',
          'hostname' => 'google-public-dns-a.google.com',
          'city' => 'Mountain View',
          'region' => 'California',
          'country' => 'US',
          'loc' => '37.3860,-122.0840',
          'org' => 'AS15169 Google LLC',
          'postal' => '94035',
          'phone' => '650'
        }
      }
    end

    it 'calls HTTParty and returns the response' do
      response = IpChecker.new.check
      expect(response['ip']).to eq '8.8.8.8'
      expect(response['loc']).to eq '37.3860,-122.0840'
    end
  end
end
