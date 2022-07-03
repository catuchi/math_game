class Player

  attr_accessor :lives
  attr_reader :name

  def initialize(name)
    @name = name
    @lives = 3
    puts "initializing players at #{@lives} lives"
  end

  def decrement_live
    @lives -= 1
  end

  def is_dead
    lives == 0
  end

  def is_alive
    !is_dead
  end
end