class GameController < ApplicationController
  # This action is for the bare domain. You can ignore it.
  #def home
    #redirect_to("/mockup.html")
  #end

  # Your code goes below.
   def rps

    @user_move = params["the_move"]

    @computer_move = ["rock", "paper", "scissors"].sample

    m = Move.new
      m.user_move = @user_move
      m.computer_move = @computer_move


    if @user_move == @computer_move
      @outcome = "tied"
      m.user_wins = 0
      m.computer_wins = 0
      m.tie = 1
      m.save
    elsif @user_move == "paper" && @computer_move == "rock"
      @outcome = "won"
      m.user_wins = 1
      m.computer_wins = 0
      m.tie = 0
      m.save
    elsif @user_move == "paper" && @computer_move == "scissors"
      @outcome = "lost"
      m.user_wins = 0
      m.computer_wins = 1
      m.tie = 0
      m.save
    elsif @user_move == "scissors" && @computer_move == "rock"
      @outcome = "lost"
      m.user_wins = 0
      m.computer_wins = 1
      m.tie = 0
      m.save
    elsif @user_move == "scissors" && @computer_move == "paper"
      @outcome = "won"
      m.user_wins = 1
      m.computer_wins = 0
      m.tie = 0
      m.save
    elsif @user_move == "rock" && @computer_move == "paper"
      @outcome = "lost"
      m.user_wins = 0
      m.computer_wins = 1
      m.tie = 0
      m.save
    elsif @user_move == "rock" && @computer_move == "scissors"
      @outcome = "won"
      m.user_wins = 1
      m.computer_wins = 0
      m.tie = 0
      m.save
    end

  #counting wins, losses, and ties
    @rockwin = Move.where({ :user_move => "rock", :user_wins => "1" }).count
    @paperwin = Move.where({ :user_move => "paper", :user_wins => "1" }).count
    @scissorswin = Move.where({ :user_move => "scissors", :user_wins => "1" }).count

    @rockloss = Move.where({ :user_move => "rock", :computer_wins => "1" }).count
    @paperloss = Move.where({ :user_move => "paper", :computer_wins => "1" }).count
    @scissorsloss = Move.where({ :user_move => "scissors", :computer_wins => "1"}).count

    @rocktie = Move.where({ :user_move => "rock", :tie => "1" }).count
    @papertie = Move.where({ :user_move => "paper", :tie => "1" }).count
    @scissorstie = Move.where({ :user_move => "scissors", :tie => "1"}).count

    @total_w = @rockwin + @paperwin + @scissorswin
    @total_l = @rockloss + @paperloss + @scissorsloss
    @total_t = @rocktie + @papertie + @scissorstie

    @records = Move.count

    @all_moves = Move.all

  render("move.html.erb")
 end
end
