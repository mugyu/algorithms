# 分布数えソート
#   高速, 外部, 安定
#   バケットソート(bucket sort)の一種
#   整列のキーがMIN..MAX の範囲の整数でなければならない。

require 'pp'

MAX = 8
MIN = 0

def dist_sort(n, a, b)
  count = Array.new(MAX - MIN + 1, 0) # countの初期化
  
  i = 0
  while i < n
    count[a[i] - MIN] += 1            # a[i]の分布を求める
    i += 1
  end
  p count
  
  i = 1
  while i <= MAX - MIN
    count[i] += count[i - 1]          # 分布を累積し順位に変換
    i += 1
  end
  p count
  
  i = n - 1
  while i >= 0
    x = a[i] - MIN                    # 順位に従ってa[i]を整列
    b[count[x] -= 1] = x
    i -= 1
  end
  b
end

a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
b = Array.new(a.size, 0)

pp a
pp dist_sort(a.size, a, b)
