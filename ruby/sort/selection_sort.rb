# 選択ソート
#   選択法, 低速, 内部, 不安定

require 'pp'

def selection_sort(n, a)
  i = 0
  while i < n
    mini = a[i]
    k = i
    j = i + 1
    while j < n
      if a[j] < mini  # 最小値の値と添え字を取得
        mini = a[j]
        k = j
      end
      j += 1
    end
    a[k] = a[i]       # a[i]と最小値を持っている要素を交換
    a[i] = mini
    i += 1
  end
  a
end

a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
pp a
pp selection_sort(a.size, a)
