# ラディックス(基数)ソート
#   高速, 安定, 外部
#   バケットソート(bucket sort)の一種

require 'pp'

def radix_sort(n, length, a, work)
  count = Array.new(UCHAR_MAX)

  # 配列に格納されている文字列を最下位から逆順に
  # 格納されている文字をキーにして分布数えソートを繰り返す。
  j = length - 1
  while j >= 0
    #
    # 分布数えソート
    #

    # countの初期化
    i = 0
    while i <= UCHAR_MAX
      count[i] = 0
      i += 1
    end

    # 分布のカウント
    i = 0
    while i < n
      count[a[i][j].to_i] += 1 # to_iメソッドで nil を 0 扱い
      i += 1
    end

    # 分布を累積して順位に変換
    i = 1
    while i < UCHAR_MAX
      count[i] += count[i - 1]
      i += 1
    end

    # 順位に従ってaをworkに整列
    i = n - 1
    while i >= 0
      work[count[a[i][j].to_i] -= 1] = a[i]
      i -= 1
    end

    # workの内容をaに書き戻し
    i = 0
    while i < n
      a[i] = work[i]
      i += 1
    end
    j -= 1
  end
  a
end

def rand_str(length)
  str = ""
  r = rand(length) + 1
  r.downto(0) do |i|
    str << (rand(25) + 65).chr
  end
  str
end

UCHAR_MAX = 255
a = [rand_str(10), rand_str(10), rand_str(10), rand_str(10), rand_str(10),
     rand_str(10), rand_str(10), rand_str(10), rand_str(10), rand_str(10),
     rand_str(10), rand_str(10), rand_str(10), rand_str(10), rand_str(10)]
p a
work = Array.new(a.size)
b = radix_sort(a.size, 10, a, work)
p b
if a.sort == b
  puts "ok."
else
  puts "error!"
end
