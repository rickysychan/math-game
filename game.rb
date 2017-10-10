require 'pry'
require './question'
require './player'

class Game 
    attr_accessor :entry1, :entry2, :rollNumber
    def start
        puts "What is your name player 1?"
        print "> "
        entry1 = $stdin.gets.chomp
        @player1 = Player.new(entry1)
        puts @player1.inspect

        puts "What is your name player 2?"
        print "> "
        entry2 = $stdin.gets.chomp
        @player2 = Player.new(entry2)
        puts @player2.inspect

    end
    def math_questions
        a = Random.rand(1..20)
        b = Random.rand(1..20)
        @question = Questions.new(a,b)
        puts "----NEW TURN ----"
        puts "Question: what is #{a} + #{b}?"
        puts "#{@question.answer}"
    end

    def player1_turn 
    
        puts "#{@player1.name}, please answer the question"
        print "> "
        @player1_answer = $stdin.gets.to_i
        if @player1_answer == @question.answer 
            @player1.add_score
            puts "Yay that's correct! Your score is now #{@player1.score}"
        else 
            @player1.subtract_life
            puts "Oh no! the answer was #{@question.answer}. You have #{@player1.life} life remaining"
        end
    end

    def player2_turn 
        puts "#{@player2.name}, please answer the question"
        print "> "
        @player2_answer = $stdin.gets.to_i
        if @player2_answer == @question.answer 
            @player2.add_score
            puts "Yay that's correct! Your score is now #{@player2.score}"
        else 
            @player2.subtract_life
            puts "Oh no! the answer was #{@question.answer}. You have #{@player2.life} life remaining"
        end
    end

    def is_dead?
        @player1.life == 0 || @player2.life == 0
    end

    def game_over
        if @player1.life == 0 
            puts "Game over, #{@player2.name} wins."
            else @player2.life == 0
            puts "Game over, #{@player1.name} wins."
        end
    end

end 

new_game = Game.new
new_game.start

100.times do
    if 
        new_game.is_dead?
        new_game.game_over
        break
    end
    new_game.math_questions
    new_game.player1_turn
    if 
        new_game.is_dead?
        new_game.game_over
        break
    end
    new_game.math_questions
    new_game.player2_turn
end



