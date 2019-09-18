# 微分(derivative)
#  limb→a f(b)-f(a) /（b-a）
#            差分    / 間隔
data = [
  #x, y
  [1, 10.0],
  [2,  7.0],
  [3,  8.0],
  [4, 11.0],
  [5,  6.0],
]
x, y = data.transpose

h = []
(x.length - 1).times do |i|
  h[i] = x[i + 1] - x[i]
end

# 一次微分#
d1 = [0]
(x.length - 1).times do |i|
  d1[i + 1] = Rational(y[i + 1] - y[i],  h[i])
end
p d1

# 二次微分#
d2 = [0]
(x.length - 1).times do |i|
  d2[i + 1] = Rational(d1[i + 1] - d1[i], x[i + 1] - x[i])
end
p d2
