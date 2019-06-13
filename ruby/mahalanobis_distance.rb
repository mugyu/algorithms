# マハラノビスの(汎)距離
#   - http://case.f7.ems.okayama-u.ac.jp/statedu/hbw2-book/node130.html
require 'matrix'

def mahalanobis_distance(a, b, s)
  a = Matrix.rows([a])
  b = Matrix.rows([b])
  s = Matrix.rows(s).inverse
  ((a - b) * s * (a - b).transpose)[0, 0]
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
  vector.inject(0){|r, x|r += (x - mean) ** 2} / size
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

# 平均
def mean(vector)
  vector.inject(0){|r, x|r += x} / vector.size.to_f
end

if $0 == __FILE__
  require 'pp'
  puts "mahalanobis_distance"
  p a = [1, 2, 3,  4]
  p b = [3, 5, 8, 13] 
  p c = [52, 45, 55, 48] 
  pp s = variance_covariace_matrix([a, b, c])
  pp means = [mean(a), mean(b), mean(c)]
  pp mahalanobis_distance([2, 5, 45], means, s)
  pp mahalanobis_distance([3, 8, 50], means, s)
  pp mahalanobis_distance([2, 6, 52], means, s)
  pp mahalanobis_distance(means, means, s)
end
