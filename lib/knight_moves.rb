class KnightMoves
  KNIGHT_MOVES = [
    [2, 1], [2, -1], [-2, 1], [-2, -1],
    [1, 2], [1, -2], [-1, 2], [-1, -2]
  ].freeze

  def initialize
    p knight_moves([0, 0], [7, 7])
  end

  def knight_moves(start, finish)
    @start = start
    @finish = finish
    knight_moves_helper(start, finish)
  end

  def knight_moves_helper(start, finish)
    queue = [[start]]
    until queue.empty?
      path = queue.shift
      current = path.last
      return path if current == finish

      get_knight_moves(current).each do |move|
        next if path.include?(move)

        queue << (path + [move])
      end
    end
  end

  def get_knight_moves(position)
    x, y = position
    KNIGHT_MOVES.each_with_object([]) do |(dx, dy), moves|
      new_x = x + dx
      new_y = y + dy
      moves << [new_x, new_y] if valid_move?(new_x, new_y)
    end
  end

  def valid_move?(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end
end

KnightMoves.new
