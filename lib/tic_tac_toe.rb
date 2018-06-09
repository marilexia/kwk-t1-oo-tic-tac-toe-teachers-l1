
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

  def input_to_index(user_input)
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
    input = gets.strip
    index = input_to_index(user_input)
      if valid_move?(index)
        move(index, current_player)
      else
        turn
      #   until valid_move?(index)
      #     puts "Please enter 1-9:"
      #     input = gets
      #     index = input_to_index[input]
      # end
      # move(index, current_player)
    end
      display_board
    end

    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def won?

      WIN_COMBINATIONS.each do |win_combination|
        if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" || @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
          return win_combination
        end
      end
          return false
    end

    def full?
      if @board.all?{|t| t == "X" || t == "O"}
        return true
      end
      return false
    end

    def draw?
      !won? && full? ? true : false
      #code above translates to if not won and/but full return true else false
    end

    def over?
      won? || draw? || full? ? true : false
    end

    def winner

    if won?
      win_combination = won?
      if @board[win_combination] == "X"
        return "X"
      winner = board[winning_token[0]]
      return winner
    else
      return nil
    end

  end

end #of class TicTacToe
