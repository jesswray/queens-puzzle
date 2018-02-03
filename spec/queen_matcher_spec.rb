require 'spec_helper'
require_relative '../lib/queen_matcher'
require_relative '../lib/queen'

RSpec.describe QueenMatcher do
  def create_queens(sets)
    sets.map do |coordinates|
      Queen.new.tap do |queen|
        queen.coordinates = coordinates
      end
    end
  end

  def matcher(sets)
    QueenMatcher.new(create_queens(sets)).attacking?
  end

  describe '#attacking?' do
    it 'understands horizontally attacking queens' do
      expect(matcher([[2, 5], [2, 8]])).to be true
    end

    it 'understands vertically attacking queens' do
      expect(matcher([[17, 9], [2, 9]])).to be true
    end

    it 'understands diagonally attacking queens' do
      expect(matcher([[6, 3], [3, 6]])).to be true
    end

    it 'returns false if queens cannot attack' do
      expect(matcher([[2, 2], [6, 5]])).to be false
    end
  end
end
