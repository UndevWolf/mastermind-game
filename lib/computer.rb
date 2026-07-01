# frozen_string_literal: true

require './lib/compare'
class Computer
  include Compare
  attr_accessor :name, :guesses, :guess_list, :results

  def initialize
    @name = "The machine"
    @guess = [1, 1, 1, 1]
    @guesses = 0
    @guess_list = []
    @results = []
  end

  def make_code
    Array.new(4) { rand(1..6) }
  end

  def guess
    if @guesses.zero?
      @guess
    elsif @results[@guesses - 1].sum.zero?
      @guess.map! { |n| n + 1 }
    elsif @results[@guesses - 1].sum == 4
      @guess = @guess.shuffle
    elsif @results[@guesses - 1].sum >= 1
      @guess = solve
    end

    @guesses += 1
    @guess
  end

  def solve
    increase = 4 - @results[@guesses - 1].sum
    (1..increase).each do |n|
      @guess[-n] += 1
    end
    @guess
  end
end
