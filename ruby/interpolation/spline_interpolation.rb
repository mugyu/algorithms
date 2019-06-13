# ������֐��p3���X�v���C�����

class Spline
  # �������D3���X�v���C����ԋȐ������߂�
  def initialize(x, y)
    @x = x
    @y = y
    @z = []
    
    n = @x.length
    h = []
    d = []
    # �[������: ���[���̓񎟓��֐���0�Ƃ���
    @z[0] = @z[n-1] = 0
    
    
    (n - 1).times do |i|
      h[i    ] =  @x[i + 1] - @x[i]         # ����
      d[i + 1] = (@y[i + 1] - @y[i]) / h[i] # �ꎟ�������v�Z
    end
    @z[1] = d[2] - d[1] - h[0] * @z[0]
    d[1]  = 2 * (@x[2] - @x[0])
    
    # �񎟔������v�Z
    #for i in 1...n-2
    1.upto(n - 3) do |i|
      t = h[i] / d[i]
      @z[i + 1] = d[i + 2] - d[i + 1] - @z[i] * t
      d[i + 1]  = 2 * (@x[i + 2] - @x[i]) - h[i] * t
    end
    @z[n - 2] -= h[n - 2] * @z[n - 1]
    
    (n - 2).downto(1) do |i|
      @z[i] = (@z[i] - h[i] * @z[i + 1]) / d[i]
    end
  end
  
  # ��Ԓl��Ԃ����\�b�h
  def interpolate(t)
    i = 0
    j = @x.length - 1
    while i < j
      k = (i + j) / 2
      if (@x[k] < t)
        i = k + 1
      else
        j = k
      end
    end
    i -= 1 if i > 0
    h = @x[i+1] - @x[i]
    d = t - @x[i]
    return (((@z[i+1] - @z[i]) * d / h + @z[i] * 3) * d
          + ((@y[i+1] - @y[i]) / h
          -  (@z[i] * 2 + @z[i+1]) * h)) * d + @y[i]
  end
end

if $0 == __FILE__
  x = [1, 2, 3, 4, 5]
  y = [2.0, 1.1, 2.4, 3.2, 5.9]
  curve = Spline.new(x, y)
  i = 1.0
  while i <= 5.0
    printf("%f,%f\r\n", i, curve.interpolate(i))
    i += 0.1
  end
end
