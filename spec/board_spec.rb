require 'spec_helper'
require_relative '../board'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end


  it "should print an empty board" do
    expect(@board.print).to eq "| | | |\n| | | |\n| | | |\n" 
  end

  it "should add a valid move" do 
    @board.move({:row => 0, :column => 0}, :x)
    expect(@board.print).to eq "|x| | |\n| | | |\n| | | |\n" 
  end

  it "should add a another valid move" do 
    @board.move({:row => 1, :column => 2}, :o)
    expect(@board.print).to eq "| | | |\n| | |o|\n| | | |\n" 
  end

  it "should print a complex board" do
    @board.move({:row => 0, :column => 1}, :o)
    @board.move({:row => 1, :column => 1}, :o)
    @board.move({:row => 2, :column => 1}, :o)

    @board.move({:row => 2, :column => 0}, :x)
    @board.move({:row => 2, :column => 2}, :x)
    @board.move({:row => 0, :column => 0}, :o)
    expect(@board.print).to eq "|o|o| |\n| |o| |\n|x|o|x|\n" 
  end

  it "should fail if the position index is out of range" do 
    expect {@board.move({:row => 3, :column => 0}, :x) }.to raise_error(ArgumentError)
  end

  it "should fail if the value is invalid" do 
    expect {@board.move({:row => 2, :column => 2}, :r) }.to raise_error(ArgumentError)
  end

  describe "Test win moves" do
    it "should win if the first row is full" do
      @board.move({:row => 0, :column => 0}, :x)
      @board.move({:row => 0, :column => 1}, :x)
      @board.move({:row => 0, :column => 2}, :x)
      expect(@board.x_wins?).to eq(true)
    end

     it "should win if the last row is full" do
      @board.move({:row => 2, :column => 0}, :x)
      @board.move({:row => 2, :column => 1}, :x)
      @board.move({:row => 2, :column => 2}, :x)
      expect(@board.x_wins?).to eq(true)
    end

    it "should not win if the last row has an O" do
      @board.move({:row => 2, :column => 0}, :x)
      @board.move({:row => 2, :column => 1}, :o)
      @board.move({:row => 2, :column => 2}, :x)
      expect(@board.x_wins?).to eq(false)
    end

    it "should not win if the last row has an empty value" do
      @board.move({:row => 2, :column => 0}, :o)
      @board.move({:row => 2, :column => 2}, :o)
      expect(@board.o_wins?).to eq(false)
    end

    it "should win if a column is full of o's" do
      @board.move({:row => 0, :column => 1}, :o)
      @board.move({:row => 1, :column => 1}, :o)
      @board.move({:row => 2, :column => 1}, :o)
      expect(@board.o_wins?).to eq(true)
    end

     it "should win if a column is full of o's and there are other random values" do
      @board.move({:row => 0, :column => 1}, :o)
      @board.move({:row => 1, :column => 1}, :o)
      @board.move({:row => 2, :column => 1}, :o)

      @board.move({:row => 2, :column => 0}, :x)
      @board.move({:row => 2, :column => 2}, :x)
      @board.move({:row => 0, :column => 0}, :o)

      expect(@board.o_wins?).to eq(true)
    end

    it "should win if a diagonal is full of x's" do
      @board.move({:row => 0, :column => 0}, :x)
      @board.move({:row => 1, :column => 1}, :x)
      @board.move({:row => 2, :column => 2}, :x)

      expect(@board.x_wins?).to eq(true)
      expect(@board.o_wins?).to eq(false)
    end
  end

end