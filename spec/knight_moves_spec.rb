require_relative '../lib/knight_moves'

RSpec.describe KnightMoves do
  let(:knight_moves) { KnightMoves.new }

  describe '#find_knight_moves' do
    it 'returns the correct path from [0, 0] to [7, 7]' do
      expect(knight_moves.find_knight_moves([0, 0], [7, 7])).to eq([[0, 0], [2, 1], [4, 2], [6, 3], [4, 4], [6, 5], [7, 7]])
    end

    it 'returns the correct path from [0, 0] to [1, 2]' do
      expect(knight_moves.find_knight_moves([0, 0], [1, 2])).to eq([[0, 0], [1, 2]])
    end

    it 'returns the correct path from [3, 3] to [4, 5]' do
      expect(knight_moves.find_knight_moves([3, 3], [4, 5])).to eq([[3, 3], [4, 5]])
    end
  end

  describe '#is_valid_move?' do
    it 'returns true for a valid move within the board' do
      expect(knight_moves.valid_move?(4, 5)).to be true
    end

    it 'returns false for a move outside the board' do
      expect(knight_moves.valid_move?(8, 8)).to be false
    end
  end

  describe '#possible_knight_moves' do
    it 'returns all valid knight moves from a given position' do
      expect(knight_moves.possible_moves([0, 0])).to contain_exactly([2, 1], [1, 2])
    end
  end
end