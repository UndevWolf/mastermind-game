# frozen_string_literal: true

require './lib/compare'
class Computer
  include Compare
  attr_accessor :name, :guesses

  def initialize
    @name = "The machine"
    @guesses = 0
  end

  def make_code
    Array.new(4) { rand(1..8) }
  end

  def guess
    @guesses += 1
    [1, 1, 1, 1]
  end
end
