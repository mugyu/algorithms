# LINEAR HASH
#   線形二乗アルゴリズムを使用
#   僅かにLINEAR HASHの方が早いが誤差の範疇のような感じ
#   分割数が2のべき乗でないとLINEAR HASHの方が遅い
#   C言語とかならもっと違いが出るかも
require 'benchmark'

def least_squares(num)
  return 0 if num == 0
  return 1 if num == 1
  2 ** Math.log(num, 2).ceil
end

def linear_hash(n, v, num)
  n & (v - 1)
#  return t if t < num
#  t & ((v / 2).ceil - 1)
end

def hash(n, num)
  n % num
end

TIMES = 1000000000
DIVISION_NUMBER = 2 ** 6
Benchmark.bm 11 do |r|
  r.report "LINEAR HASH" do
    v = least_squares(DIVISION_NUMBER)
    TIMES.times do |n|
      linear_hash(n, v, DIVISION_NUMBER)
    end
  end

  r.report "HASH" do
    TIMES.times do |n|
      hash(n, DIVISION_NUMBER)
    end
  end
end
#                   user     system      total        real
# LINEAR HASH  43.945000   0.000000  43.945000 ( 43.986806)
# HASH         44.179000   0.000000  44.179000 ( 44.259180)
