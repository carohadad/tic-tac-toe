require 'spec_helper'
require_relative '../tic_tac_toe'

RSpec.describe TicTacToe do
  it "has a new empty board when the game start" do
    game = TicTacToe.new
    expect(game.board).not_to be_nil 
  end
end