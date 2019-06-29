# 非周期関数用3次スプライン補間
# http://hooktail.org/computer/index.php?Ruby%BC%C2%CD%D1%CE%E3%20%A1%C1%A5%B9%A5%D7%A5%E9%A5%A4%A5%F3%CA%E4%B4%D6%A1%C1
class Spline
  # 初期化．3次スプライン補間曲線を求める
  def initialize(x, y)
    @x = x
    @y = y
    @z = []
    @n = @x.length - 1

    h = []
    d = []

    # 端末処理: 両端末の二次導関数を0とする
    @z[0] = @z[@n] = 0r

    (0...@n).each do |i|
      # 距離
      h[i] = @x[i + 1] - @x[i]
      # 一次微分を計算
      d[i + 1] = Rational(@y[i + 1] - @y[i], h[i])
    end

    @z[1] = d[2] - d[1] - h[0] * @z[0]
    d[1] = 2r * (@x[2] - @x[0])

    # 二次微分を計算
    (1...@n - 1).each do |i|
      t = Rational(h[i], d[i])
      @z[i + 1] = d[i + 2] - d[i + 1] - @z[i] * t
      d[i + 1] = 2r * (@x[i + 2] - @x[i]) - h[i] * t
    end

    @z[@n - 1] -= h[@n - 1] * @z[@n]

    (@n - 1).downto(1) do |i|
      @z[i] = Rational(@z[i] - h[i] * @z[i + 1], d[i])
    end
  end

  # 補間値を返すメソッド
  def interpolate(t)
    i = 0
    j = @n

    while i < j
      k = ((i + j) / 2).floor
      if @x[k] < t
        i = k + 1
      else
        j = k
      end
    end
    i -= 1 if i > 0

    h = @x[i + 1] - @x[i]
    d = t - @x[i]

    (((@z[i + 1] - @z[i]) * d / h + @z[i] * 3) * d \
      + ((@y[i + 1] - @y[i]) / h \
        - (@z[i] * 2r + @z[i + 1]) * h)) * d \
      + @y[i]
  end
end

if $0 == __FILE__
  x = [1, 2, 3, 4, 5]
  y = [2.0, 1.1, 2.4, 3.2, 5.9]
  curve = Spline.new(x, y)
  1r.step(6r, 0.1r) do |i|
    printf("%f, %f\n", i, curve.interpolate(i))
  end
end

