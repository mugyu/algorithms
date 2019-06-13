def multiplication(a, b)
  size = a.size
  d = Array.new(size){Array.new(size, 0)}
  a.size.times do |l|
    b[0].size.times do |m|
      size.times do |n|
        d[l][m] += a[l][n] * b[n][m]
      end
    end
  end
  d
end

a = [
  [3, 5],
  [0, 0]
]
s = [
  [ 2 / 5.to_f, -0],
  [ 0,  5 / 18.to_f]
]
p x = multiplication(multiplication([[3,5], [0,0]], s), [[3,0], [5,0]])
p Math.sqrt(x[1][0] ** 2 + x[0][0] ** 2)
p x[1][0] + x[0][0]
