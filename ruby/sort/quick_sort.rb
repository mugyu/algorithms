# クイックソート
#   交換法, 高速, 内部, 不安定

require 'pp'

def quick_sort(first, last, a)
  i = first
  j = last
  x = a[(first + last) / 2]
  loop do
    i += 1 while a[i] < x
    j -= 1 while a[j] > x
    break if i >= j
    t    = a[i]
    a[i] = a[j]
    a[j] = t
    i += 1
    j -= 1
    p a if $DEBUG
  end
  quick_sort(first, i - 1, a) if i - 1 > first
  quick_sort(j + 1, last, a)  if j + 1 < last
  a
end

a = [rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9), rand(9)]
pp a if $DEBUG
b = quick_sort(0, a.size - 1, a)
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
b = quick_sort(0, a.size - 1, a)
pp b if $DEBUG
