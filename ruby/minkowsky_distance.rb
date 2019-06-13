# ミンコフスキー距離
def minkowsky_distance(a, b, k)
  m = [a.size, b.size].max
  d = 0
  m.times do |l|
    d += (a[l] - b[l]) ** k.to_f if a[l] and b[l]
  end
  d / k
end

# シティブロック距離
def cityblock_distance(a, b)
  minkowsky_distance(a, b, 1)
end

# ユークリッド平方距離
def euclidean_distance(a, b)
  minkowsky_distance(a, b, 2)
end

if $0 == __FILE__
  puts "==="
  p a = [2, 4,  6]
  p b = [4, 8, 12]
  k = 2
  puts "#{k}: Euclidean distance = #{minkowsky_distance(a, b, k)}" 
  k = 1
  puts "#{k}: cityblock distance = #{minkowsky_distance(a, b, k)}" 
  puts "===="
  p a = [12, 14, 16]
  p b = [ 8, 16, 24]
  k = 2
  puts "#{k}: Euclidean distance = #{minkowsky_distance(a, b, k)}" 
  k = 1
  puts "#{k}: cityblock distance = #{minkowsky_distance(a, b, k)}" 
  puts "===="
  p a = [1, 2, 4]
  p b = [1, 2, 4]
  k = 2
  puts "#{k}: Euclidean distance = #{minkowsky_distance(a, b, k)}" 
  k = 1
  puts "#{k}: cityblock distance = #{minkowsky_distance(a, b, k)}" 
end
