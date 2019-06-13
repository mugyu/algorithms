# マージソート
#   併合法, 高速, 外部, 安定

require 'pp'

def merge_sort(first, last, a, work)
  if first < last
    middle = (first + last) / 2 # 
    merge_sort(first, middle, a, work)
    merge_sort(middle + 1, last, a, work)

    # 前半をworkに格納
    p = 0
    i = first
    while i <= middle
      work[p] = a[i]
      p += 1
      i += 1
    end
    p(["work", first, i - 1, work.map{|item|item.key if item}])
    p(["   a", a.map{|item|item.key}])

    # 前半と後半のマージ
    i = middle + 1                # 後半用カウンタ
    j = 0                         # 前半用カウンタ
    k = first                     # 前半用カウンタ
    while i <= last and j < p
      if work[j].key <= a[i].key  # 前半と後半を比較
        a[k] = work[j]            # 前半どうしで交換
        j += 1
      else
        a[k] = a[i]               # 前半と後半を交換
        i += 1
      end
      k += 1
    end
    p(["   a", a.map{|item|item.key}])

    while j < p                   # 前半の残りをコピー
      a[k] = work[j]
      k += 1
      j += 1
    end
    p(["   a", a.map{|item|item.key}])
  end
  a
end

Item = Struct.new(:key, :info)

a = [Item.new(rand(9), rand(9)), Item.new(rand(9), rand(9)),
     Item.new(rand(9), rand(9)), Item.new(rand(9), rand(9)),
     Item.new(rand(9), rand(9)), Item.new(rand(9), rand(9)),
     Item.new(rand(9), rand(9)), Item.new(rand(9), rand(9)),
     Item.new(rand(9), rand(9)), Item.new(rand(9), rand(9))]

p a.map{|item|item.to_a}
work = Array.new(a.size / 2 + 1)
p merge_sort(0, a.size - 1, a, work).map{|item|item.to_a}
