class KnightMoves
  def initialize
    @board = Array.new(8) { Array.new(8, 0) }
    knight_moves([0, 0], [7, 7])
  end

  def knight_moves(start, finish)
    @start = start
    @finish = finish
    p knight_moves_helper(start, finish)
  end

  # Use BFS to find the shortest path
  def knight_moves_helper(start, finish)
    queue = []
    queue << [start]
    until queue.empty?
      path = queue.shift
      current = path.last
      return path if current == finish

      get_knight_moves(current).each do |move|
        next if path.include?(move)

        new_path = path.dup << move
        queue << new_path
      end
    end
  end

  # Generates all possible knight moves from a given position
  def get_knight_moves(start)
    x, y = start
    moves = []
    knight_moves = [
      [2, 1], [2, -1], [-2, 1], [-2, -1],
      [1, 2], [1, -2], [-1, 2], [-1, -2]
    ]
    knight_moves.each do |move|
      new_x = x + move[0]
      new_y = y + move[1]
      moves << [new_x, new_y] if valid_move?(new_x, new_y)
    end
    moves
  end

  def valid_move?(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end
end

KnightMoves.new