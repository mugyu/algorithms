# Zコンビネータ
#https://ja.wikipedia.org/wiki/%E4%B8%8D%E5%8B%95%E7%82%B9%E3%82%B3%E3%83%B3%E3%83%93%E3%83%8D%E3%83%BC%E3%82%BF#Z%E3%82%B3%E3%83%B3%E3%83%93%E3%83%8D%E3%83%BC%E3%82%BF
# Z =  λf . (λx . f (λy . x x y)) (λx . f (λy . x x y))
#値渡し評価（適用順序）でも使用可能なバージョンのYコンビネータは、通常のYコンビネータの一部をη変換することで与えられる。

# lambdaリテラル(lambda litral)で書くとこう
# * 複数行の場合はlambda式で書く
# * .call() で書く方が良いらしいけど、まとまっている所は簡便に.()
def Z(func)
  lambda do |f|
    ->(x) { ->(y) { f.(x.(x)).(y) } }.call(
      ->(x) { ->(y) { f.(x.(x)).(y) } }
    )
  end.call(func)

# []でcallする場合
# lambda do |f|
#     lambda{ |x| lambda{ |y| f[x[x]][y] } }[
#       lambda{ |x| lambda{ |y| f[x[x]][y] } }
#     ]
# end[func]
# .callメソッドで書くとこう
# lambda do |f|
#     lambda{ |x|lambda{ |y| f.call(x.call(x)).call(y) } }.call(
#       lambda{ |x|lambda{ |y| f.call(x.call(x)).call(y) } })
# end.call(func)
end

# フィボナッチ数
fib = Z( ->(f) { ->(n) { n < 2 ? n : f.call(n - 2) + f.call(n - 1) } } )
(1..10).each do |n|
  p fib.call(n)
end
# => 1
# => 1
# => 2
# => 3
# => 5
# => 8
# => 13
# => 21
# => 34
# => 55
