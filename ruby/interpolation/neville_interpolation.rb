# Neville補間

require 'pp'

N = 6

def neville_interpolation(x, y, t)
  w = Array.new(N)
  N.times do |i|
    w[i] = y[i].to_f
    (i - 1).downto(0) do |j|
      w[j] = w[j + 1] + (w[j + 1] - w[j]) * (t - x[i]) / (x[i] - x[j])
    end
  end
  w[0]
end

x = [10, 20, 30, 40, 50, 60]
y = [30, 80, 90, 120, 130, 180]
pp neville_interpolation(x, y, ARGV.shift.to_f)
