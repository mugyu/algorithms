# 逆写像ソート
#   高速, 外部, 安定
#   整列のキーがMIN..MAX の範囲の整数でなければならない。

require 'pp'

MAX = 8
MIN = 0

def inverse_mapping_sort(n, a, b, next_index)
  index = Array.new(MAX - MIN + 1)

  i = n - 1
  while i >= 0                # 逆順に通読
    x  = a[i] - MIN
    next_index[i] = index[x]  # x = a[i] = a[j] = a[k] の時
                              # next[i] = j, next[j] = k, index[k] = nil
    index[x] = i              # indexにxの添え字をマッピング
                              # 等しいxは最小の添え字を代表とする
    i -= 1
  end
  p [" next", next_index]
  p ["index", index]

  j = 0
  x = 0
  while x <= MAX - MIN
    i = index[x]
    while i
      b[j] = a[i]
      i = next_index[i]
      j += 1
    end
    x += 1
  end
  b
end

a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
pp a
b          = Array.new(a.size, 0)
next_index = Array.new(a.size)
p inverse_mapping_sort(a.size, a, b, next_index)
