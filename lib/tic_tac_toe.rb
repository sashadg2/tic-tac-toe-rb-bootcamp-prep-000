WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
end

def move(arr,position,value)
  arr[position] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(arr,pos)
  if (pos >= 0 && pos <= 8 && position_taken?(arr,pos) == false)
    return true
  else return false
  end
end

def turn(board)
  puts "Where would you like to go?"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    board[index] = "X"
  else turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |element|
    if element == "X" || element == "O"
      count = count + 1
    end
  end
    return count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "O"
  else
    return "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
      return false
end

def full?(board)
  board.each do |element|
    if element != "X" && element != "O"
      return false
    end
  end
  return true
end

def draw?(board)
  if won?(board) == false && full?(board)
    return true
  else return false
  end
end

def over?(board)
  if won?(board) != false || full?(board) || draw?(board)
    return true
  else return false
  end
end

def winner(board)
  if won?(board) == false
    return nil
  elsif board[won?(board)[0]] == "X"
      return "X"
  elsif board[won?(board)[0]] == "O"
    return "O"
  end
end
