# Newton補間
# - http://ja.wikipedia.org/wiki/%E3%83%8B%E3%83%A5%E3%83%BC%E3%83%88%E3%83%B3%E8%A3%9C%E9%96%93

require 'pp'

N = 6

def maketable(x, y)
  a = Array.new(N)
  w = Array.new(N)
  N.times do |i|
    w[i] = y[i].to_f
    (i - 1).downto(0) do |j|
      w[j] = (w[j + 1] - w[j]) / (x[i].to_f - x[j].to_f)
    end
    a[i]  = w[0]
  end
  a
end

def newton_interpolation(x, y, t)
  a = maketable(x, y)
  p = a[N - 1]
  (N - 2).downto(0) do |i|
    p = p * (t - x[i]) + a[i]
  end
  p
end

x = [10, 20, 30, 40, 50, 60]
y = [30, 80, 90, 120, 130, 180]
#interpolate
pp newton_interpolation(x, y, ARGV.shift.to_f)
