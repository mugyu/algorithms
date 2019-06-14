# ヒープソート
#   選択法, 高速, 内部, 不安定

require 'pp'

def heap_sort(n, a)
  k = n / 2
  while k >= 1
    i = k
    x = a[i]
    while (j = 2 * i) <= n
      j += 1 if j < n and a[j] < a[j + 1] # a2i と a2i+1を大小比較
      break  if x >= a[j]                 # ai と 上記の大きい値を比較
      a[i] = a[j]
      i = j
    end
    a[i] = x
    k -= 1
    p ["1st", a]
  end

  while n > 1
    x = a[n]
    a[n] = a[1]
    n -= 1
    i = 1
    while (j = 2 * i) <= n
      j += 1 if j < n and a[j] < a[j + 1]
      break  if x >= a[j]
      a[i] = a[j]
      i = j
    end
    a[i] = x
    p ["2nd", a]
  end
  a
end

a = [nil, rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
pp ["ini", a]
heap_sort(a.size - 1, a)
