require_relative 'board'

class TicTacToe

  def initialize
    @board = Board.new
    @move_index = 0
  end

  def nobody_won_yet?
  	not @board.x_won? and not @board.o_won? 
  end

  def print_board
    @board.print
  end

  def turn_player_1?
    @move_index % 2 == 0
  end

  def move(user_input)
    move = user_input.split(",")
    position = {:row => move[0].to_i, :column => move[1].to_i}

    if turn_player_1?
      @board.move(position, :x)
    else
      @board.move(position, :o)
    end
    @move_index += 1
  end

end



prompt = '> '
game = TicTacToe.new

puts "Hello!! Welcome to the Tic Tac Toe game!"
puts "In order to play you need to enter the position for your next move"
puts "Columns and Rows are indexed from 0 to 2"
puts "Enter 1,2 if you'd like your move to be entered in row: 1 colum: 2"
puts "Let's start!"

while (game.nobody_won_yet?) 
  puts game.print_board

  if (game.turn_player_1?)
    puts "It's Player 1's turn. Player 1 uses X"
  else
    puts "It's Player 2's turn. Player 2 uses O"
  end
  puts "Enter your move in format row,column. Example 2,1 for row: 2 colum: 1"
  puts prompt
  user_input = $stdin.gets.chomp

  game.move(user_input)
end

puts "Someone won! end of game"
puts game.print_board

