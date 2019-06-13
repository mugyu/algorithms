# 騎士の巡歴

require 'pp'

N = 5
                                    #  2  1
DX = [2, 1, -1, -2, -2, -1,  1,  2] # 3    0
DY = [1, 2,  2,  1, -1, -2, -2, -1] #
$count = 0                          # 4    7
$no = 0                             #  5  6

def knights_tour(board, x, y)
  return if board[x][y] > 0
  board[x][y] = $count += 1
  if $count == N * N
    print_board(board)
  else
    0.upto(7) do |i|
      knights_tour(board, x + DX[i], y + DY[i])
    end
  end
  board[x][y] = 0
  $count -= 1
end

def print_board(board)
  puts "-" * 40
  puts "No. #{$no += 1}"
  2.upto(N + 1) do |i|
    2.upto(N + 1) do |j|
      printf("%4d", board[i][j])
    end
    print "\n"
  end
end

board = Array.new(N + 4){Array.new(N + 4, 1)}

2.upto(N + 1) do |i|
  2.upto(N + 1) do |j|
    board[i][j] = 0
  end
end
knights_tour(board, 2, 2)
