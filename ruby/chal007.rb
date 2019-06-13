# 動的計画法
# 問題
#   A[i]に関して、
#   i<=0のとき、A[i] = 1
#   i>0のとき、A[i] = A[i/p-x] + A[i/q-y]
#   と定義する。n、p、q、x、yが与えられた時、A[n]を求めなさい。
#   ただし、nは10^13以下、p,qは2以上10^9以下、x、yは0以上10^9以下とします
def calc1(n, p, q, x, y)
  dp = Array.new(n + 1, 0)
  dp[0] = 1
  (1..n).each do |i|
    nexta = i / p - x
    nextb = i / q - y
    if nexta <= 0
      dp[i] = dp[i] + 1
    else
      dp[i] = dp[i] + dp[nexta]
    end
    if nextb <= 0
      dp[i] = dp[i] + 1
    else
      dp[i] = dp[i] + dp[nextb]
    end
  end
  dp[n]
end

# 再帰
def calc2(n, p, q, x, y)
  saiki2(n, p, q, x, y)
end

def saiki2(n, p, q, x, y)
  if n <= 0
    1
  else
    saiki2(n / p - x, p, q, x, y) + saiki2(n / q - y, p, q, x, y)
  end
end

# メモ化再帰(Array)
def calc3(n, p, q, x, y)
  @dp = Array.new(n + 1, 0)
  saiki3(n, p, q, x, y)
end

def saiki3(n, p, q, x, y)
  if n <= 0
    1
  else
    if @dp[n] == 0
      @dp[n] = saiki3(n / p - x, p, q, x, y) + saiki3(n / q - y, p, q, x, y)
    else
      @dp[n]
    end
  end
end

# メモ化再帰(Hash)
def calc4(n, p, q, x, y)
  @dp = Hash.new
  saiki4(n, p, q, x, y)
end

def saiki4(n, p, q, x, y)
  if n <= 0
    1
  else
    if @dp.has_key? n
      @dp[n]
    else
      @dp[n] = saiki4(n / p - x, p, q, x, y) + saiki4(n / q - y, p, q, x, y)
    end
  end
end

# メモ化再帰(Hash)
def calc5(n, p, q, x, y)
  @dp = Hash.new
  saiki5(n, p, q, x, y)
end

def saiki5(n, p, q, x, y)
  return 1      if n <= 0
  return @dp[n] if n <= 1000000 && @dp.has_key?(n)
  res = saiki5(n / p - x, p, q, x, y) + saiki5(n / q - y, p, q, x, y)
  @dp[n] = res  if n <= 1000000
  res
end

n = 50
p = 2
q = 3
x = 4
y = 1

puts "動的計画法"
p calc1(n, p, q, x, y)
puts "再帰"
p calc2(n, p, q, x, y)
puts "メモ化再帰(Array)"
p calc3(n, p, q, x, y)
puts "メモ化再帰(Hash)"
p calc4(n, p, q, x, y)
puts "メモ化再帰(最適化)"
p calc5(n, p, q, x, y)
