# 最大公約数と最小公倍数
# - Rationalクラスに gcd とlcm のメソッドあり

class Integer
  def gcd(other)
    min = self.abs
    max = other.abs
    while min > 0
      tmp = min
      min = max % min
      max = tmp
    end
    max
  end

  def lcm(other)
    if self.zero? or other.zero?
      0
    else
      (self * other / self.gcd(other)).abs
    end
  end
end

require 'pp'

pp "3 gcd 12  = #{3.gcd(12)}"
pp "6 gcd 123 = #{6.gcd(123)}"
pp "3 lcm 12  = #{3.lcm(12)}"
pp "6 lcm 123 = #{6.lcm(123)}"
