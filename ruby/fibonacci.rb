require 'benchmark'

def fib1(n)
  if n == 0
    return 0
  end
  if n == 1
    return 1
  end
  fib1(n - 1) + fib1(n - 2)
end

def fib2(n)
  @memo ||= {}
  if n == 0
    return 0
  end
  if n == 1
    return 1
  end
  if @memo.key? n
    return @memo[n]
  end
  @memo[n] = fib2(n - 1) + fib2(n - 2)
end

def fib3(n)
  if n == 0
    return 0
  end
  fib = fib1 = 1
  fib2 = 0
  (n - 1).times do
    fib = fib1 + fib2
    fib2 = fib1
    fib1 = fib
  end
  fib
end

def display(result)
  return
  if result == false
    puts
  end
  print result
  print " "
end

Benchmark.bm 5 do |r|
#  計算量が違いすぎるので除外
#            user     system      total        real
#  fib1    1.108000   0.000000   1.108000 (  1.098591)
#  r.report "fib1" do
#    [0,1,2,3,4,5,6,7,8,35].each do |n|
#      display(fib1(n))
#    end
#    display(false)
#  end
  r.report "fib2" do
    [0,1,2,3,4,5,6,7,8,35,100,5000].each do |n|
      display(fib2(n))
    end
    display(false)
  end
  r.report "fib3" do
    [0,1,2,3,4,5,6,7,8,35,100,5000].each do |n|
      @memo = {}
      display(fib3(n))
    end
    display(false)
  end
end
