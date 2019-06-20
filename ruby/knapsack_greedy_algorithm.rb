# ナップサック問題
#   貪欲法による解法
require 'pp'
data = [
#  [2, 3],
#  [1, 2],
#  [3, 6],
#  [2, 1],
#  [1, 3],
#  [5, 85],
  #w,v
  [2, 3],
  [1, 2],
  [3, 6],
  [2, 1],
  [1, 3],
  [5, 85],
]

payload = 8

def knapsack(data, payload)
  tmp = data.sort_by do |weight, value|
    # 「価値 / 重さ」を評価値とする
    Rational(value, weight)
  end.reverse

  #c = 0
  #w = 0
  #tmp.each do |weight, value|
  #  if weight + w < payload
  #    w += weight
  #    c += value
  #  end
  #end
  #[w, c]

  tmp.reduce([0, 0]) do |memo, element|
    if element[0] + memo[0] < payload
      memo[0] += element[0]
      memo[1] += element[1]
    end
    memo
  end
end

pp knapsack(data, payload)

# [7, 90]
#
# 厳密解（最適解）は 91 (w = 8, c = 91) だけど、ほぼ正解

# https://ja.wikipedia.org/wiki/%E8%B2%AA%E6%AC%B2%E6%B3%95
#
# for i := 1 .. n
#   e[i] := c[i] / w[i]
#
# e[i] の値を降順にソートして、 c[i], w[i] をそれに合わせて並び替える。
#
# C := 0; W := 0
# for i := 1 .. n
#   if w[i] + W < max then
#     W := W + w[i]
#     C := C + c[i]
# return C
