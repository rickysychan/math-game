require 'pry'
require './game'
require './question'

class Player
    attr_accessor :name, :score, :life

    def initialize(name)
        @name = name
        @life = 3
        @score = 0
      end

    def add_score
        @score += 100
    end
    def subtract_life
        @life -= 1
    end

end 

# player1 = Player.new('Morty')
# puts player1.name

