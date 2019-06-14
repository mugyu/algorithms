# バブルソート
#   交換法, 低速, 内部, 安定

require 'pp'

def bubble_sort(n, a)
  k = n - 1
  while k >= 0
    j = -1               # 番人
    i = 1
    while i <= k
      if a[i - 1] > a[i] # 隣の要素と大小比較
        j = i - 1
        x    = a[j]      #
        a[j] = a[i]      # 隣の要素と値を交換
        a[i] = x         #
      end
      i += 1
    end
    k = j                # 最後に交換した要素までを整列
    p a if $DEBUG
  end
  a
end

a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
pp a if $DEBUG
b = bubble_sort(a.size, a)
if $DEBUG
  if a.sort == b
    puts "ok."
  else
    puts "error!"
    pp b.sort if $DEBUG
  end
end
pp b if $DEBUG
exit
a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
pp a if $DEBUG
b = bubble_sort(a.size, a)
pp b if $DEBUG
