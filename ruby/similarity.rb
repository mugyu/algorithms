# 下記urlを参考に作ってみた。
# http://blog.livedoor.jp/techblog/archives/64737211.html
# 0.4 から 0.5 ぐらいだと人の目で見ても明らかに似ている
# 0.6 を越すようなら細部の入れ替え以外ほぼ同じ
require 'enumerator'
require 'nkf'

class String
  def similarity(text)
    set1 = tri_gram(self)
    set2 = tri_gram(text)
    size = (set1.size + set2.size).to_f
    (size - (set1 - set2).size - (set2 - set1).size) / size
  end

  private

  def n_gram(n, text)
    uni_gram(text).each_cons(n).to_a
  end

  def uni_gram(text)
    NKF.nkf("-m0 -w", text).gsub(/[\s　]/u, "").split(//u)
  end

  def bi_gram(text)
    n_gram(2, text)
  end

  def tri_gram(text)
    n_gram(3, text)
  end
end

if $0 == __FILE__
  text1 = open(ARGV.shift){|f|f.read}
  text2 = open(ARGV.shift){|f|f.read}
  puts text1.similarity(text2)
end
