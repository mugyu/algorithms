# ナップサックの問題
#   - 動的計画法
#
# ナップザックの大きさと，それに詰めたい各品目の大きさと値段とが与えられてい
# るとき値段の合計ができるだけ大きくなるような詰め方を求める問題である。同じ
# 品目をいくつ詰めても構わないが大きさの合計はナップザックの大きさを越えては
# ならない。元の問題より小さいサイズの問題から順に解いていく動的計画法の考え
# 方を使う。

require 'pp'

knapsize = 3
sizes  = [2,1,3,3,2,2]
prices = [1,2,2,3,2,6]
newitem = []
smallest = 1

maxsofar = Array.new(knapsize + 1, 0)
sizes.zip(prices).each_with_index do |item, i|
  size, price = item
  s = size
  while s <= knapsize
    newvalue = maxsofar[s - size] + price
    if maxsofar[s] < newvalue
      maxsofar[s] = newvalue
      newitem[s]  = i
    end
    s += 1
  end
  p maxsofar
end

p newitem
puts "品目  価格"
s = knapsize
while s >= smallest
  printf("%4d %5d\n", newitem[s], prices[newitem[s]])
  s -= sizes[newitem[s]]
end
printf("合計 %5d\n",maxsofar[knapsize])
