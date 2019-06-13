# does not work
class Array
  def qsort!
    quicksort(0, self.size - 1)
  end

  def quicksort(left, right)
    if left < right
      p = left
      k = left + 1
      while k <= right
        if self[k] < self[left]
          self[p + 1], self[k] = self[k], self[left]
          p += 1
        end
        self[left], self[p] = self[p], self[left]
        quicksort(left, p - 1)
        quicksort(p + 1, right)
      end
    end
  end

  def rqsort!
    randomized_quicksort(0, self.size - 1)
  end

  def randomized_quicksort(left, right)
    if left < right
      r = rand(right - left + 1) + left
      self[left], self[r] = self[r], self[left]
      p = left
      k = left + 1
      while k <= right
        if self[k] < self[left]
          self[p + 1], self[k] = self[k], self[p + 1]
          p += 1
        end
        k += 1
      end
      self[left], self[k] = self[k], self[left]
      randomized_quicksort(left, p - 1)
      randomized_quicksort(p + 1, right)
    end
  end
end

a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
a.qsort!
p a
