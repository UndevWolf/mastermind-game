# frozen_string_literal: true

class Game
  attr_accessor :player, :computer, :guess, :code

  def initialize
    @player = Player.new
    @computer = Computer.new
    @board = ''
    play
  end

  def play
    system 'clear'
    puts 'Game Start.'
    @code = computer.make_code
    game_round
    puts "The code was: #{code.join(', ')}"
  end

  def game_round
    10.times do
      @guess = player.guess
      result = computer.compare(guess, code)
      system 'clear'
      @board += "#{guess} - #{result}\n"
      puts @board
      if code == guess
        puts "You cracked the code in #{player.guesses} tries."
        break
      end
    end
  end
end
