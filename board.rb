class Board

  def initialize
    @tokens = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  def move(position, value)
    
    raise ArgumentError, "Invalid Value: Possible values are :x or :o" unless value == :x or value == :o

    row = position[:row]
    column = position[:column]

    unless (0..2).include? row and (0..2).include? column
      raise ArgumentError, "Invalid position. Example: {:row => 0, :column => 0}. Values for row and column should be between 0 and 2"
    end

    @tokens[row][column] = value
  end

  def x_won?
    won?(:x)
  end

  def o_won?
    won?(:o)
  end

  def won?(player)
    # A full set of the value for player in any of the rows
    return true if @tokens.any? {|row| row.all? {|value| value == player}}
    # A full set of the value for player  in any of the columns
    return true if (0..2).any? {|column| (0..2).all?{|row| @tokens[row][column] == player}}
    # A full set of the value for player  in one diagonal
    return true if [@tokens[0][0], @tokens[1][1], @tokens[2][2]].all?{ |value| value == player }
    #A full set of the value for player  in the other diagonal
    return true if [@tokens[0][2], @tokens[1][1], @tokens[2][0]].all?{ |value| value == player }

    #Otherwise this player does not win
    false
  end

  def print
    board = ""
    @tokens.each do |row|
      board << "|"
      row.each do |value| 
        board << value.to_s + "|"
      end
      board << "\n"
    end
    board
  end

end