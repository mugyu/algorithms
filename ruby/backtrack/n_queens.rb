# N王妃の問題

require 'pp'

N = 8

def queens(a, b, c, x, i)
  j = 0
  while j < N
    if a[j] == 1 and b[i + j] == 1 and c[i - j + N - 1] == 1
      x[i] = j
      if i < N - 1
        a[j]             = 0
        b[i + j]         = 0
        c[i - j + N - 1] = 0
        queens(a, b, c, x, i + 1)
        a[j]             = 1
        b[i + j]         = 1
        c[i - j + N - 1] = 1
      else
        found(x)
      end
    end
    j += 1
  end
end

def found(x)
  puts "--" * (N + 1)
  puts "No.#{@count += 1}" 
  0.upto(N) do |i|
    0.upto(N) do |j|
      if x[i] == j
        print " Q"
      else
        print " ."
      end
    end
    print "\n"
  end
end

@count = 0
a = Array.new(N, 1)
b = Array.new(2 * N - 1, 1)
c = Array.new(2 * N - 1, 1)
x = Array.new(N)
queens(a, b, c, x, 0)
