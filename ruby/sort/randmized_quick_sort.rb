# クイックソート
class Array
  def qsort!
    quicksort(0, self.size - 1)
  end

  def quicksort(left, right)
    return if left >= right
    p = left
    k = left + 1
    while k <= right
      if self[k] < self[left]
        p += 1
        self[p], self[k] = self[k], self[p]
      end
      k += 1
    end
    self[left], self[p] = self[p], self[left]
    quicksort(left, p)
    quicksort(p + 1, right)
  end

  def rqsort!
    randomized_quicksort(0, self.size - 1)
  end

  # あまりランダム無にメリットはないけど
  # 初期の並び順が最悪の場合の助かるかも
  # ただ、ランダムにピポットを選択した結果、最悪になるかもしれない
  # 結局運次第か
  def randomized_quicksort(left, right)
    return if left >= right
    r = rand(right - left) + left + 1
    self[left], self[r] = self[r], self[left]
    p = left
    k = left + 1
    while k <= right
      if self[k] < self[left]
        p += 1
        self[p], self[k] = self[k], self[p]
      end
      k += 1
    end
    randomized_quicksort(left, p)
    randomized_quicksort(p + 1, right)
  end
end

a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
p a
a.rqsort!
p a
