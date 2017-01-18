require_relative 'board'

class TicTacToe
  attr_reader :board

  def initialize
    @board = Board.new
  end
end