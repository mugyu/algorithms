require 'benchmark'

a = [4, -1, 5, -3, 2, -6, 3, 8, -7, 4]
test = 1000000

def dp1(a)
  dp = []
  dp[0] = 0
  a.each_with_index do |v, i|
    b = dp[i] + v
    dp[i + 1] = dp[i] > b ? dp[i] : b
  end
end

def dp2(a)
    max = 0
    a.each do |v|
      max = max + v if max < max + v
    end
end

Benchmark.bm 5 do |r|
  r.report "dp1" do
    test.times do
      dp1(a)[-1]
    end
  end

  r.report "dp2" do
    test.times do
      dp2(a)
    end
  end
end

#             user     system      total        real
# dp1     1.294000   0.000000   1.294000 (  1.302164)
# dp2     0.593000   0.000000   0.593000 (  0.583129)
#
# 無駄に配列を使っている dp1 の方が遅い
