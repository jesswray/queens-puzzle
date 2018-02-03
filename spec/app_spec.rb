require 'spec_helper'
require_relative '../lib/app'

RSpec.describe App do
  let(:ip_checker) { instance_double('IpChecker', latitude: 10) }
  before do
    allow(IpChecker).to receive(:new).and_return(ip_checker)
  end

  describe '#run' do
    it 'returns either an array or string' do
      value = App.new.run.class
      expect([String, Array]).to include(value)
    end
  end
end
