require 'spec_helper'
require_relative '../two_players_game'

RSpec.describe TwoPlayersGame do

  before(:each) do
    @game = TwoPlayersGame.new
  end

  it "should create an empty Game" do
    expect(@game.current_player).to eq({:player_name => "Player 1", :player_value => :x})
    expect(@game.winner).to eq(nil)
  end

  it "should advance the game if a movement is made" do
    @game.move({:row => 0, :column => 0})
    expect(@game.current_player).to eq({:player_name => "Player 2", :player_value => :o})
    expect(@game.winner).to eq(nil)
  end

  it "should print board" do
    @game.move({:row => 2, :column => 0})
    @game.move({:row => 2, :column => 1})
    @game.move({:row => 2, :column => 2})
    expect(@game.print_board).to eq "| | | |\n| | | |\n|x|o|x|\n" 
  end

  it "should show the winner" do
    @game.move({:row => 2, :column => 0})
    @game.move({:row => 0, :column => 0})
    @game.move({:row => 2, :column => 1})
    @game.move({:row => 0, :column => 1})
    @game.move({:row => 2, :column => 2})
    expect(@game.winner).to eq({:player_name => "Player 1", :player_value => :x})
    expect(@game.print_board).to eq "|o|o| |\n| | | |\n|x|x|x|\n" 
  end

  it "current_player is allways human" do
    expect(@game.current_player_is_human?).to eq(true)
    @game.move({:row => 2, :column => 0})
    expect(@game.current_player_is_human?).to eq(true)
  end
end