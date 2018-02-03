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
      coordinates = [[2, 5],[2, 8]]
      expect(matcher(coordinates)).to be true
    end

    it 'understands vertically attacking queens' do
      coordinates = [[17, 9], [2, 9]]
      expect(matcher(coordinates)).to be true
    end

    it 'understands diagonally attacking queens' do
      coordinates = [[6, 3], [3, 6]]
      expect(matcher(coordinates)).to be true
    end

    it 'returns false if queens cannot attack' do
      coordinates = [[2, 2], [6, 5]]
      expect(matcher(coordinates)).to be false
    end
  end
end
