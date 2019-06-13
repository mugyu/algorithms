# 連分数補間

require 'pp'

N = 6

def maketable(x, y)
  (N - 1).times do |j|
    (j + 1).upto(N) do |i|
      y[i] = (x[i].to_f - x[j].to_f) / (y[i].to_f - y[j].to_f)
    end
  end
end

def continued_fraction_interpolation(x, y, t)
  maketable(x, y)
  r = y[N - 1]
  (N - 2).downto(0) do |i|
    r = (t - x[i].to_f) / r + y[i]
  end
  r
end

x = [10, 20, 30, 40, 50, 60]
y = [30, 80, 90, 120, 130, 180]
#interpolate
pp continued_fraction_interpolation(x, y, ARGV.shift.to_f)
