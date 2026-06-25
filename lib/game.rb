# frozen_string_literal: true

class Game
  attr_accessor :codebreaker, :codemaker, :guess, :code, :board

  def initialize
    @board = ''
    choose_role
    play
  end

  def choose_role
    puts 'Do you want to be the codebreaker(1) or codemaker(2)?'
    case gets.chomp.to_i
    when 1
      @codebreaker = Player.new
      @codemaker = Computer.new
    when 2
      @codemaker = Player.new
      @codebreaker = Computer.new
    else
      puts "Enter '1' for codebreaker and '2' for codemaker."
    end
  end

  def play
    system 'clear'
    puts 'Game Start.'
    @code = codemaker.make_code
    game_round
    puts "The code was: #{code.join(', ')}"
  end

  def game_round
    10.times do
      guess = codebreaker.guess
      result = codemaker.compare(guess, code)
      system 'clear'
      @board += "#{guess} - #{result}\n"
      puts @board
      if code == guess
        puts "#{codebreaker.name} cracked the code in #{codebreaker.guesses} tries."
        break
      end
    end
  end

end
