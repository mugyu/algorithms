#  シュウォーツ変換
#    一時作業用のメモリ消費が増大するが各要素の変換が一回の通読で終わるため
#    変換コストは減

def schwartzian_transform_sort(a)
  a.map do |x|
    [x, yield(x)]
  end.sort do |a, b|
    a[1] <=> b[1]
  end.map do |x|
    x[0]
  end
end

a = ["aaa", "ABC", "XXX", "xyz"]
# 普通にソート
p a.sort{|x, y|x.downcase <=> y.downcase}
# シュウォーツ変換でソート
p schwartzian_transform_sort(a){|x|x.downcase}
# Rubyの.sort_by はシュウォーツ変換
p a.sort_by{|x|x.downcase}
