# 2次元配列の列と行を入れ替え
require 'pp'
arr = [
  [11,12,13,14,15,16,17,18],
  [21,22,23,24,25,26,27,28],
  [31,32,33,34,35,36,37,38],
  [41,42,43,44,45,46,47,48],
  [51,52,53,54,55,56,57,58],
  [61,62,63,64,65,66,67,68],
  [71,72,73,74,75,76,77,78],
  [81,82,83,84,85,86,87,88],
]

pp arr
size = arr.size
size.times do |x|
  (x + 1...size).each do |y|
    arr[x][y], arr[y][x] = arr[y][x], arr[x][y]
  end
end
pp arr
