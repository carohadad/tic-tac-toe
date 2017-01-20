require_relative 'board'

class TwoPlayersGame

  PLAYER_1 = {:player_name => "Player 1", :player_value => :x}
  PLAYER_2 = {:player_name => "Player 2", :player_value => :o}

  def initialize
    @board = Board.new
    @move_index = 0
    @player_turn = PLAYER_1
  end

  def current_player_is_human?
    true
  end

  def winner
    if @board.x_won?
      PLAYER_1
    elsif @board.o_won? 
      PLAYER_2
    else
      nil
    end
  end

  def print_board
    @board.print
  end

  def current_player
    if @move_index % 2 == 0
      PLAYER_1
    else
      PLAYER_2
    end
  end

  def move(position)
    @board.move(position, current_player()[:player_value])
    @move_index += 1
  end

end

