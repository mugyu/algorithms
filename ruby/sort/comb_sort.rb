# コムソート
#   交換法, 高速, 内部, 不安定
#   バブルソートの改良版
#   挿入法におけるシェルソートと同様の改良

require 'pp'

def comb_sort(n, a)
  swapped = true
  h = (n / 1.3).to_i
  while h > 1 or swapped == true
    h = (h / 1.3).to_i
    h = 1  if h == 0
    h = 11 if h == 9 or h == 10 # 改良版アルゴリズム
                                # アルゴリズムを改良したというか
                                # パラメータを適正化して効率化を図った。
    p [h, a] if $DEBUG
    i = 0
    swapped = false
    while i + h < n
      j = i + h
      if a[i] > a[j]
        x    = a[i]
        a[i] = a[j]
        a[j] = x
        swapped = true
      end
      i += 1
    end
  end
  a
end

a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
     rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
pp a if $DEBUG
b = comb_sort(a.size, a)
pp b if $DEBUG
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
b = comb_sort(a.size, a)
pp b if $DEBUG
if $DEBUG
  if a.sort == b
    puts "ok."
  else
    puts "error!"
    pp b.sort if $DEBUG
  end
end
