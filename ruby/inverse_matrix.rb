# 逆行列

require 'pp'

def inverse_matrix(a)
  n = a.size
  w = a.map do |x|
    return nil unless n == x.size
    x.dup
  end
  n.times do |k|
    t = w[k][k].to_f
    return nil if t.zero?
    n.times do |i|
      w[k][i] /= t
    end
    w[k][k] = 1 / t
    n.times do |j|
      unless j ==k
        u = w[j][k].to_f
        n.times do |i|
          if i == k
            w[j][i] = -u / t
          else
            w[j][i] -= w[k][i] * u
          end
        end
      end
    end
  end
  w
end

a = [
  [-6,  9, -1],
  [ 7, -9,  3],
  [-5,  4, -5]
]
pp a
pp i = inverse_matrix(a)
pp a
pp inverse_matrix(i)
puts "----"
a = [
  [ 1,  0,  1],
  [ 3,  1,  8],
  [-2,  0, -1]
]
pp a
pp i = inverse_matrix(a)
pp inverse_matrix(i)
pp a

def multiplication(i, a)
  size = i.size
  d = Array.new(size){Array.new(size, 0)}
  size.times do |l|
    size.times do |m|
      size.times do |n|
        d[l][m] += i[l][n] * a[n][m]
      end
    end
  end
  d
end

puts "==="
pp multiplication(i, a)

puts "****"
pp a = [
  [9024.0 * 2 / 18,   8895.0 * 2 / 18],
  [8895.0 * 2 / 18,  12568.0 * 2 / 18]
]
pp i = inverse_matrix(a)
pp inverse_matrix(i)

puts "****"
pp a = [
  [3, 2],
  [7, 5]
]
pp i = inverse_matrix(a)
pp inverse_matrix(i)
