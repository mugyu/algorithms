# 基本挿入ソート
#   挿入法, 低速, 内部, 安定

require 'pp'

def insertion_sort(n, a)
  i = 1
  while i < n
    x = a[i]
    j = i - 1
    while j >= 0 and a[j] > x
      a[j + 1] = a[j]
      j -= 1
    end
    a[j + 1] = x
    i += 1
    p a
  end
  a
end

pp arr = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
insertion_sort(arr.size, arr)
