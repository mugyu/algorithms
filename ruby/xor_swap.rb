# XOR交換アルゴリズム

def xor_swap(x, y)
  x = x ^ y
  y = x ^ y
  x = x ^ y
  [x, y]
end

x = 1
y = 10
p [x, y]
p xor_swap(x, y)

puts "benchmark"
require 'benchmark'
Benchmark.bm do |x|
  n = 1_000_000
  a = 1
  b = 10
  x.report("       xor:") do 
    n.times do
      a = a ^ b
      b = a ^ b
      a = a ^ b
      [a, b]
    end
  end
  x.report("Arithmetic:") do 
    n.times do
      a += b
      b -= a
      a -= b
      [a, b]
    end
  end
  x.report("       tmp:") do
    n.times do
      t = a
      a = b
      b = t
      [a, b]
    end
  end
end
