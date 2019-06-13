# マージ

require 'pp'

def merge(a, na, b, nb)
  c = Array.new(na + nb - 1)
  i = j = k = 0
  while i < na and j < nb
    if a[i] <= b[j]
      c[k] = a[i]
      i += 1
    else
      c[k] = b[j]
      j += 1
    end
    k += 1
  end
  
  while i < na
    c[k] = a[i]
    i += 1
    k += 1
  end

  while j < nb
    c[k] = b[j]
    j += 1
    k += 1
  end
  c
end

p a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)].sort
p b = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)].sort

p merge(a, a.size, b, b.size)
