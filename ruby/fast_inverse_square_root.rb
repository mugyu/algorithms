# 高速逆平方根計算アルゴリズム
# https://en.wikipedia.org/wiki/Fast_inverse_square_root
# https://itchyny.hatenablog.com/entry/2016/07/25/100000
def fast_inverse_square_root(x)
  i = [x].pack("e").unpack("i")[0]
  i = 0x5f3759df - (i >> 1)
  y = [i].pack("i").unpack("e")[0]
  y * (1.5 - 0.5 * x * y * y)
end

if __FILE__ == $0
  STDIN.each_line do |line|
    p fast_inverse_square_root(line.to_f)
  end
end
