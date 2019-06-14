# Shellソート
#  挿入法, 高速, 内部, 不安定
#  基本挿入ソートの改良系
#    列をh飛ばしに分割しそれざれを基本挿入ソート。
#    次第にhの幅を少なくして上記を繰り返し、
#    最終的にはh=1の時、基本挿入ソートで終わる。

require 'pp'

def shell_sort(n, a)
  h = 13
  h = 3 * h + 1 while h < n
  h = h / 9                      # 適用な間隔
  while h > 0
    # h=1 の時、基本挿入ソート
    i = h
    while i < n
      x = a[i]
      j = i - h
      while j >= 0 and a[j] > x
        a[j + h] = a[j]
        j -= h
      end
      a[j + h] = x
      i += 1
      p a
    end
    h = h / 3                   # 間隔を1/3に縮小
  end
  a
end

pp a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
        rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9),
        rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
pp shell_sort(a.size, a)
