# 部分和問題
require 'benchmark'
require "pp"
data = [7,5,3]

def subset1(data, number)
  dp = [0]

  data.each do |v1|
    dp.length.times do |j|
      v = v1 + dp[j]
      return true if v == number
      dp.push(v) unless dp.include? v
    end
  end
  false
end

def subset2(data, number)
  # 初期化
  dp = Array.new(1, Array.new(number + 1, nil))
  dp[0][0] = true

  # メインループ
  data.length.times do |i|
    # 各行の初期化
    dp[i + 1] = Array.new(number + 1, nil)
    v = data[i]
    # 各項目のループ
    dp[i].length.times do |j|
      if dp[i][j]
        return true if j + v == number
        dp[i + 1][j + v] = true if j + v < number
        dp[i + 1][j] = true
      end
    end
  end
  false
end

test = 100000
Benchmark.bm 5 do |r|
  r.report "subset1" do
    test.times do
      subset1(data, 10)
    end
  end

  r.report "subset2" do
    test.times do
      subset2(data, 10)
    end
  end
end
