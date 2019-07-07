# 3次Spline補間
#  線形補間になっている気がするので後で調べる
class Spline
  def initialize(dataX, dataY)
    @x = dataX
    @y = dataY

    @length = @x.length - 1

    # 間隔
    @h = Array.new(20, 0.0)
    # 一次微分
    dif1 = Array.new(20, 0.0)
    # 二次微分
    @dif2 = Array.new(20, 0.0)

    (1..@length).each do |i|
      # 間隔を計算
      @h[i] = @x[i] - @x[i - 1]
      # 一次微分
      dif1[i] = Rational(@x[i] - @x[i - 1], @h[i])
    end

    # 二次微分
    (1..@length).each do |i|
      @dif2[i] = Rational(dif1[i] - dif1[i - 1], @x[i] - @x[i - 1])
    end
  end

  def calc
    i = 1
    result = []
    x = @x[0]
    while x < @x[@length]
      # 第１項
      yy0 = Rational(@dif2[i - 1], 6 * @h[i]) \
            * (@x[i] - x) * (@x[i] - x) * (@x[i] - x)
      # 第２項
      yy1 = Rational(@dif2[i], 6 * @h[i]) \
            * (x - @x[i - 1]) * (x - @x[i - 1]) * (x - @x[i - 1])
      # 第３項
      yy2 = (Rational(@y[i - 1], @h[i]) - Rational(@h[i] * @dif2[i - 1], 6)) \
            * (@x[i] - x)
      # 第４項
      yy3 = (Rational(@y[i], @h[i]) - Rational(@h[i] * @dif2[i], 6)) \
            * (x - @x[i - 1])
      y = yy0 + yy1 + yy2 + yy3
      result.push([x, y.to_f])
      i += 1 if x >= @x[i]
      x += 0.1r
    end
    result
  end
end

x = [1, 2, 3, 4, 5]
y = [2.0, 1.1, 2.4, 3.2, 5.9]
s = Spline.new(x, y)
s.calc.each do |_, yy|
  puts yy
end
