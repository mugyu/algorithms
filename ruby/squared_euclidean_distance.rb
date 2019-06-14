# 標準化ユークリッド平方距離
#   s = 変量の分散
#   - http://case.f7.ems.okayama-u.ac.jp/statedu/hbw2-book/node129.html

def squared_euclidean_distance(a, b, s = nil)
  m = [a.size, b.size].max
  s = (0...m).map{|k|variance([a[k], b[k]])} unless s
  d = 0
  m.times do |k|
    if a[k] and b[k]
      distance = a[k] - b[k]
      d += distance ** 2.0 / s[k] unless distance.zero?
    end
  end
  d
end

# 平均
def mean(vector)
  vector.inject(0){|r, x|r += x} / vector.size.to_f
end

# 分散
def variance(vector)
  mean = mean(vector)
  vector.inject(0){|r, x|r += (x - mean) ** 2} / vector.size.to_f
end

if $0 == __FILE__
  puts "----"
  a = [2, 4,  6]
  b = [4, 8, 12]
  p a
  p b
  p squared_euclidean_distance(a, b)
  puts "----"
  a = [12, 14, 16]
  b = [ 8, 16, 24]
  p a
  p b
  p squared_euclidean_distance(a, b)
  puts "----"
  a = [1, 2, 4]
  b = [1, 2, 4]
  p a
  p b
  p squared_euclidean_distance(a, b)
end
