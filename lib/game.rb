# frozen_string_literal: true

class Game
  attr_accessor :breaker, :maker, :code, :board

  def initialize
    @board = ''
    choose_role
    play
  end

  def choose_role
    puts 'Do you want to be the codebreaker(1) or codemaker(2)?'
    case gets.chomp.to_i
    when 1
      @breaker = Player.new
      @maker = Computer.new
    when 2
      @maker = Player.new
      @breaker = Computer.new
    else
      puts "Enter '1' for codebreaker and '2' for codemaker."
    end
  end

  def play
    system 'clear'
    puts 'Game Start.'
    @code = maker.make_code
    game_round
    puts "The code was: #{code.join(', ')}"
  end

  def game_round
    10.times do
      round_guess = breaker.guess
      breaker.guess_list << round_guess
      round_result = maker.compare(round_guess, code)
      breaker.results << round_result
      system 'clear'
      @board += "#{round_guess} - #{round_result}\n"
      puts @board
      if code == round_guess
        puts "#{breaker.name} cracked the code in #{breaker.guesses} tries."
        break
      end
    end
  end

end
