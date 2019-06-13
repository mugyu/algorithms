# 拡張ユークリッド互除法 (Extended Euclid's. Algorithm)
#   x > 0, y > 0 に対して ax + by = c となる a, b, c = gcd(a, b) を求める
def extended_gcd(x, y)
 r0 = x; r1 = y
 a0 = 1; a1 = 0
 b0 = 0; b1 = 1
 while r1 > 0
   t  = a1
   a1 = a0 - r0 / r1 * a1
   a0 = t

   t  = b1
   b1 = b0 - r0 / r1 * b1
   b0 = t

   t  = r1
   r1 = r0 % r1
   r0 = t
 end
 [a0, b0, r0]
end

def ex_gcd(x, y, a0 = 1, a1 = 0, b0 = 0, b1 = 1)
  if y > 0
    ex_gcd(y, x % y, a1, a0 - x / y * a1, b1, b0 - x / y * b1)
  else
    return [a0, b0, x]
  end
end

x = 334
y = -335
a, b, c = extended_gcd(x, y)
puts "#{a} * #{x} + #{b} * #{y} = #{c}"
puts "---"
a, b, c = ex_gcd(x, y)
puts "#{a} * #{x} + #{b} * #{y} = #{c}"
puts "--------------"
x = 678
y = 66
a, b, c = extended_gcd(x, y)
puts "#{a} * #{x} + #{b} * #{y} = #{c}"
puts "---"
a, b, c = ex_gcd(x, y)
puts "#{a} * #{x} + #{b} * #{y} = #{c}"

require 'benchmark'
Benchmark.bm do |bmk|
  x = 678
  y = 66
  n = 100000
  bmk.report{n.times{extended_gcd(x, y)}}
  bmk.report{n.times{ex_gcd(x, y)}}
end
