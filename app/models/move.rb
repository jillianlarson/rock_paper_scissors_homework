class Move < ActiveRecord::Base
    @all_moves = Move.all
  m = Move.new
    m.user_move = @user_move
    m.computer_move = @computer_move
    if @outcome == "won"
      m.user_wins = 1
      m.computer_wins = 0
    elsif @outcome == "lost"
      m.user_wins = 0
      m.computer_wins =1
    else
      m.user_wins = 0
      m.computer_wins = 0
    end
    m.save
end
