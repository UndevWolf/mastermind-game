# frozen_string_literal: true

class Computer
  def make_code
    Array.new(4) { rand(1..8) }
  end

  def compare(guess, code)
    result = [0, 0]
    code.each_with_index do |num, i|
      if guess[i] == code[i]
        result[0] += 1
      elsif guess.include?(num)
        result[1] += 1
      end
    end
    result
  end

  def guess
    Array.new(4) { rand(1..8) }
  end
end
