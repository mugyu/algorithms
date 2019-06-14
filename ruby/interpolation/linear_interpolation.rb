# 線形補間

require 'pp'

def interpote(x, y, t)
  (y[1] - y[0]).to_f * (t - x[0]).to_f / (x[1] - x[0]).to_f + y[0]
end

x = [10, 40]
y = [20, 120]

[10, 15, 20, 25, 30, 35, 40, 50, 60, 70].each do |t|
  p interpote(x, y, t)
end
