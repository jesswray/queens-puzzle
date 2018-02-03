require 'spec_helper'
require_relative '../lib/chessboard'

RSpec.describe Chessboard do
  let(:board) { Chessboard.new(9) }

  describe 'assign_pieces' do
    before do
      board.assign_pieces
    end

    it 'assigns n/2 pieces' do
      expect(board.pieces.count).to eq 4
    end

    it 'assigns coordinates to a piece' do
      [:x, :y].each do |coord|
        expect(board.pieces.first.public_send(coord)).not_to be_nil
      end
    end

    it 'assigns unique coordinates' do
      expect(board.coordinates.uniq).to eq board.coordinates
    end
  end
end
