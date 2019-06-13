# クイックソート
#   かなり富豪的なつくり
#   クイックソートの二分木、分割統治あたりの概要を掴むのには良かろう
require "pp"
#data = [3, 9, 6, 1, 2]
data = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
pp data

def quickSort(data)
  return data if data.length < 2
  pivot = data.shift
  # 再帰の度に配列を新たな配列を準備して前の配列を捨てる辺りは超富豪的
  left = []
  right = []
  data.each do |num|
    left.push  num if num < pivot
    right.push num if num >= pivot
  end
  # 富豪的というかマージ処理も内部的にはやってる
  quickSort(left) + [pivot] + quickSort(right)
end

pp quickSort(data)
