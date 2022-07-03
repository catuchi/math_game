require './player'

class Game
  
  def initialize()
    puts 'initializing players'
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
    puts 'done initializing players'
    gameloop
    end_game_sequence
  end

  def ask

    number1 = rand(1..20)
    number2 = rand(1..20)

    puts "what is #{number1} plus #{number2}?"
    correct_answer = number1 +  number2
    answer = gets.chomp.to_i
    puts answer

    if answer == correct_answer
      puts 'correct'
      return true
    else
      puts 'incorrect'
      return false
    end

  end

  def toggle_player
    if @current_player == @player1
      @current_player = @player2
    else 
      @current_player = @player1
    end
  end

  def print_score
    p1 = @player1.lives
    p2 = @player2.lives
    puts "P1 #{p1}/3 vs P2 #{p2}/3"
  end
  
  def gameloop
    while (@player1.is_alive && @player2.is_alive) 
      success = ask()
      unless success
        @current_player.decrement_live
      end
      print_score
      toggle_player
      puts "---NEW TURN---"
    end
  end

  def end_game_sequence
    winner = @player1.is_alive ? @player1 : @player2

    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "---- GAME OVER ----"
    puts "Goodbye!"
  end
end
