# frozen_string_literal: true

class Player
  attr_accessor :name, :guesses

  def initialize
    puts 'Enter player name: '
    @name = gets.chomp
    @guesses = 0
  end

  def guess
    guess = []
    @guesses += 1
    puts 'Enter your guess:'
    4.times do
      guess << gets.to_i
    end
    guess
  end
end
