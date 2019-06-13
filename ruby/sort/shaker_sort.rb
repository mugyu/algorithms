# シェーカーソート(双方向バブルソート)bidirectional bubble sort
#   交換法, 低速, 内部, 安定
#   バブルソートの改良版
#   スキャン方向を毎回反転される事により前方・後方の両方から
#   スキャン範囲を狭める。

require 'pp'

def shaker_sort(n, a)
  top = 0
  bot = n - 1
  while top < bot
    # 順方向
    i = top
    while i <= bot
      if a[i - 1] > a[i] # 隣の要素と大小比較
        j = i - 1
        x    = a[j]      #
        a[j] = a[i]      # 隣の要素と値を交換
        a[i] = x         #
      end
      i += 1
    end
    bot = j              # 最後に交換した要素までを整列
    p a if $DEBUG
    break if top >= bot

    # 逆順方向
    i = bot
    while i > top
      if a[i - 1] > a[i] # 隣の要素と大小比較
        j = i - 1
        x    = a[j]      #
        a[j] = a[i]      # 隣の要素と値を交換
        a[i] = x         #
      end
      i -= 1
    end
    top = j + 1          # 最後に交換した要素までを整列
    p a if $DEBUG
  end
  a
end

a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
pp a if $DEBUG
b = shaker_sort(a.size, a)
if $DEBUG
  if a.sort == b
    puts "ok."
  else
    puts "error!"
    pp b.sort if $DEBUG
  end
end
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
b = shaker_sort(a.size, a)
pp b if $DEBUG
