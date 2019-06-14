# Lagrange補間
# - http://ja.wikipedia.org/wiki/%E3%83%A9%E3%82%B0%E3%83%A9%E3%83%B3%E3%82%B8%E3%83%A5%E8%A3%9C%E9%96%93

require 'pp'

N = 6

def lagrange_interpolation(x, y, t)
  sum = 0
   N.times do |i|
     prod = y[i].to_f
     N.times do |j|
       prod *= (t - x[j].to_f) / (x[i].to_f - x[j].to_f) if j != i
     end
     sum += prod
   end
   sum
end

x = [10, 20, 30, 40, 50, 60]
y = [30, 80, 90, 120, 130, 180]
pp lagrange_interpolation(x, y, ARGV.shift.to_f)
