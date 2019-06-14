require 'pp'

def quicksort(a, left, right)
  if left < right
    p = left
    k = left + 1
    while k <= right
      if a[k] < a[left]
        a[p + 1], a[k] = a[k], a[p + 1]
        p += 1
      end
      k += 1
    end
    a[left], a[p] = a[p], a[left]
    quicksort(a, left, p - 1)
    quicksort(a, p + 1, right)
  end
end

p ary = [5, 1, 7, 2, 6, 4, 8, 3]
quicksort(ary, 0, ary.size - 1)
p ary
