require_relative 'two_players_game'

def game_name
  %q{
   _____ _        _____            _____          
  |_   _(_)      |_   _|          |_   _|         
    | |  _  ___    | | __ _  ___    | | ___   ___ 
    | | | |/ __|   | |/ _` |/ __|   | |/ _ \ / _ \
    | | | | (__    | | (_| | (__    | | (_) |  __/
    \_/ |_|\___|   \_/\__,_|\___|   \_/\___/ \___|  

  }
end

def two_players
  %q{
    _______                    _                           _ 
   |__   __|                  | |                         | |
      | |_      _____    _ __ | | __ _ _   _  ___ _ __ ___| |
      | \ \ /\ / / _ \  | '_ \| |/ _` | | | |/ _ \ '__/ __| |
      | |\ V  V / (_) | | |_) | | (_| | |_| |  __/ |  \__ \_|
      |_| \_/\_/ \___/  | .__/|_|\__,_|\__, |\___|_|  |___(_)
                        | |             __/ |                
                        |_|            |___/                 }
end

def print_instructions
  puts game_name
  puts "You can play by calling:"
  puts
  puts "$ ruby tic_tac_toe.rb two_players"
  puts
  puts "To play with a friend."
  puts "Other ways for playing will be implemented soon!!"
end

def print_format_explanation
  puts "Invalid value"
  puts "In order to play you need to enter the position for your next move"
  puts "Columns and Rows are indexed from 0 to 2"
  puts "Enter 1,2 if you'd like your move to be entered in row: 1 colum: 2"
end

def play_game(game)
  puts game_name
  puts two_players
  puts
  print_format_explanation
  puts "Let's start!"

  while (not game.ended?) 
    puts game.print_board

    next_player = game.current_player

    puts "It's #{next_player[:player_name]}'s turn. #{next_player[:player_name]} uses #{next_player[:player_value].to_s}"
    puts '> '

    begin
      if game.current_player_is_human?
        user_input = $stdin.gets.chomp
        move = user_input.split(",")
        position = {:row => Integer(move[0]), :column => Integer(move[1])}
        game.move(position)
      else
        puts "TBI: This never happen for the moment!"
      end
    rescue TakenPositionError
      puts "Taken position, try another one"
    rescue InvalidPositionError, ArgumentError
      print_format_explanation
    end

  end

  puts "End of game!"
  if game.winner
    puts "The winner is: #{game.winner[:player_name]}" 
  else
    puts "Nobody won :(" 
  end
  puts game.print_board
end



case ARGV[0] 
  when 'help'
    print_instructions
  when 'two_players'
    game = TwoPlayersGame.new()
    play_game(game)
  else 
    print_instructions
end
    


