# 統計学の各種計算とか何とか
require 'rational'

# 平均
def mean(vector)
  Rational(vector.inject(0){|r, x|r += x}, vector.size.to_f)
end

# 分散共分散行列
def variance_covariace_matrix(matrix, unbiased = false)
  m = matrix.size
  covariace = covariace(matrix)
  s = Array.new(m){Array.new(m){covariace}}
  matrix.each_with_index{|vector, k|s[k][k] = variance(vector)}
  s
end

# 共分散
def covariace(matrix)
  m = matrix.size
  n = matrix[0].size
  matrix.inject(Array.new(n, 1)) do |r, vector|
    deviation = deviation(vector)
    (0...n).map{|i|deviation[i] * r[i]}
  end.inject(0){|r, x| r += x} / n.to_f
end

# 分散(unbiased == false: 標本分散, unbiased == true: 不偏分散)
def variance(vector, unbiased = false)
  mean = mean(vector)
  size = vector.size.to_f
  size -= 1 if unbiased and size > 5
  Rational(vector.inject(0){|r, x|r += (x - mean) ** 2}, size)
end

#不偏分散
def unbiased_variance(vector)
  variance(vector, true)
end

# 偏差
def deviation(vector, mean = nil)
  mean = mean(vector) unless mean
  vector.map{|x|x - mean}
end

# 二乗平均平方根, 平均二乗偏差
def rms(vector)
  Math.sqrt(mean(vector.map{|x|x ** 2}))
end

# 標準偏差
def standard_deviation(vector, unbiased = false)
  Math.sqrt(variance(vector, unbiased))
end

# 平均偏差
def mean_deviation(vector)
  mean = mean(vector)
  Rational(vector.inject(0){|r, x|r += (x - mean)}, vector.size.to_f)
end

# 相関関係
def correlation_coefficient(a, b)
  Rational(covariace([a, b]), (standard_deviation(a) * standard_deviation(b)))
end

# 最大公約数
# ユークリッド互除法(非再帰版)
def gcd(a, b)
  min = a.abs
  max = b.abs
  while min > 0
    tmp = min
    min = max % min
    max = tmp
  end
  max
end

# 最小公倍数
def lcm(a, b)
  if a.zero? or b.zero?
    0
  else
    (a * Rational(b, gcd(a, b))).abs
  end
end

# modulo m でのa逆数
def invert(x, n)
  a = n
  b = x % n
  p = 0
  q = 1
  v = 0
  u = 1
  while q > 0
    p = a / b
    q = a % b
    w = v - (p * u)
    a = b
    b = q
    v = u
    u = w
  end
  v % n
end

# 拡張ユークリッド互除法 (Extended Euclid's. Algorithm)
#   x > 0, y > 0 に対して ax + by = c となる a, b, c = gcd(a, b) を求める
def extended_gcd(x, y, a0 = 1, a1 = 0, b0 = 0, b1 = 1)
  if y > 0
    ex_gcd(y, x % y, a1, a0 - x / y * a1, b1, b0 - x / y * b1)
  else
    return [a0, b0, x]
  end
end

# 連分数 continued_fraction
def continued_fraction_ascend(c, b)
  n = b.size - 1
  f = 0.0
  while n > 0
    f = c[n] / (b[n] + f)
    n -= 1
  end
  b[0] + f
end
