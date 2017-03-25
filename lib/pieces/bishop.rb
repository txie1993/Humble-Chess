require_relative 'piece'
require_relative 'slide'

class Bishop < Piece
  include Slideable

  def symbol
    'B'
  end

  private

  def move_dirs
    diagonal_dirs
  end
end
