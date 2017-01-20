class Board

  def initialize
    @board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def move(position, value)
    
    raise ArgumentError, "Invalid Value: Possible values are :x or :o" unless value == :x or value == :o

    row = position[:row]
    column = position[:column]

    unless (0..2).include? row and (0..2).include? column
      raise InvalidPositionError, "Invalid position. Example: {:row => 0, :column => 0}. Values for row and column should be between 0 and 2"
    end

    raise TakenPositionError, "Invalid Position" unless empty_position?(position)

    @board[row][column] = value
  end

  def empty_position?(position)
    @board[position[:row]][position[:column]] == ' '
  end

  def x_won?
    won?(:x)
  end

  def o_won?
    won?(:o)
  end

  def won?(player)
    # A full set of the value for player in any of the rows
    return true if @board.any? {|row| row.all? {|value| value == player}}
    # A full set of the value for player  in any of the columns
    return true if (0..2).any? {|column| (0..2).all?{|row| @board[row][column] == player}}
    # A full set of the value for player  in one diagonal
    return true if [@board[0][0], @board[1][1], @board[2][2]].all?{ |value| value == player }
    #A full set of the value for player  in the other diagonal
    return true if [@board[0][2], @board[1][1], @board[2][0]].all?{ |value| value == player }

    #Otherwise this player does not win
    false
  end

  def print
    board = ""
    @board.each do |row|
      board << "|"
      row.each do |value| 
        board << value.to_s + "|"
      end
      board << "\n"
    end
    board
  end
end

class TakenPositionError < ArgumentError
end

class InvalidPositionError < ArgumentError
end
