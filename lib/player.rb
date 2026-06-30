# frozen_string_literal: true

require './lib/compare'
class Player
  include Compare
  attr_accessor :name, :guesses, :guess_list, :results

  def initialize
    puts 'Enter player name: '
    @name = gets.chomp
    @guesses = 0
    @guess_list = []
    @results = []
  end

  def guess
    @guesses += 1
    puts 'Enter your guess:'
    guess = gets.chomp.slice(0, 4)
    guess.split('').map(&:to_i)
  end

  def make_code
    puts 'Enter your code: '
    gets.chomp.slice(0, 4).split('').map(&:to_i)
  end
end
