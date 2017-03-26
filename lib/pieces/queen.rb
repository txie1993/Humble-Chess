require_relative 'piece'
require_relative 'slide'

class Queen < Piece
  include Slide

  def symbol
    'Q'
  end

  private

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end
