
class TicTacToe


  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row

  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column

  [0, 4, 8], #left to right diagonal
  [2, 4, 6] #right to left diagonal
  ]

  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index
    user_input.to_i - 1
  end

  def position_taken?(location)
    if @board[location] != " " && @board[location] != ""
      return true
    else
      return false
    end
  end

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index[input]
      if valid_move?(index)
        move(index, current_player)
      else
        until valid_move?(index)
          puts "Please enter 1-9:"
          input = gets
          index = input_to_index[input]
      end
      move(index, current_player)
    end
      display_board
end



end
