require_relative 'piece'
require_relative 'step'

class Knight < Piece
  include Step

  def symbol
    'k'
  end

  private

  def move_diffs
    [[-2, -1],
     [-1, -2],
     [-2, 1],
     [-1, 2],
     [1, -2],
     [2, -1],
     [1, 2],
     [2, 1]]
  end
end
