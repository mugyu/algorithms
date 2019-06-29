# 3次Spline補間
# https://qiita.com/edo_m18/items/f2f0c6bf9032b0ec12d4
class Spline
  def initialize(data)
    @num = data.length - 1
    @a = []
    @b = []
    @c = []
    @d = []

    # 3次多項式の0次係数(a)を設定
    (0..@num).each { |i| @a[i] = data[i] }

    # 3次多項式の2次係数(c)を計算
    @c[0] = @c[@num] = 0.0
    (1...@num).each { |i| @c[i] = 3.0 * (@a[i - 1] - 2.0 * @a[i] + @a[i + 1]) }

    # 左下を消す
    w = [0.0]
    (1...@num).each do |i|
        tmp = 4.0 - w[i - 1]
        @c[i] = Rational(@c[i] - @c[i - 1], tmp)
        w[i] = Rational(1.0, tmp)
    end

    # 右上を消す
    (1...@num).reverse_each { |i| @c[i] = @c[i] - @c[i + 1] * w[i] }

    # 3次多項式の1次係数(b)と3次係数(b)を計算
    @b[@num] = @d[@num] = 0.0
    (0...@num).each do |i|
        @d[i] = Rational(@c[i + 1] - @c[i], 3.0)
        @b[i] =  @a[i + 1] - @a[i] - @c[i] - @d[i]
    end
  end

  # 媒介変数(0～num - 1の実数）に対する値を計算
  def culc(t)
    j = t.floor
    j = 0 if j < 0
    # 丸め誤差を考慮
    j = @num - 1 if j >= @num
    dt = t - j
    @a[j] + (@b[j] + (@c[j] + @d[j] * dt) * dt ) * dt
  end
end

if $0 == __FILE__
  data = [2.0, 1.1, 2.4, 3.2, 5.9]
  sp = Spline.new(data)
  0.step(data.length, 0.1) do |i|
    p sp.culc(i)
  end
end
