# レーベンシュタイン距離
# 編集距離
#   - http://ja.wikipedia.org/wiki/%E3%83%AC%E3%83%BC%E3%83%99%E3%83%B3%E3%82%B7%E3%83%A5%E3%82%BF%E3%82%A4%E3%83%B3%E8%B7%9D%E9%9B%A2

require 'nkf'

def levenshtein_distance(str1, str2)
  arr1 = uni_gram(str1)
  arr2 = uni_gram(str2)
  n = arr1.length
  m = arr2.length
  d = Array.new(n + 1){|i| Array.new(m + 1, 0)}
  (n + 1).times do |i|
    (m + 1).times do |j|
      d[i][0] = i
      d[0][j] = j
    end
  end
  1.upto(n) do |i|
    1.upto(m) do |j|
      if arr1[i - 1] == arr2[j - 1]
        cost = 0
      else
        cost = 1
      end
      d[i][j] = [d[i - 1][j] + 1,        # 挿入
                 d[i][j - 1] + 1,        # 削除
                 d[i - 1][j - 1] + cost  # 置換
                ].min
    end
  end
  d[n][m]
end

def uni_gram(str)
  NKF.nkf("-m0 -w", str).split(//u)
end


p levenshtein_distance("kitten", "sitting") # 3
p levenshtein_distance("A@CDE", "ABCDE")    # 1
p levenshtein_distance("AB@DE", "ABCDE")    # 1
p levenshtein_distance("A@CDE", "ABCDE")    # 1
p levenshtein_distance("A@@DE", "ABCDE")    # 2
p levenshtein_distance("A", "ABCDE")        # 4
p levenshtein_distance("X", "ABCDE")        # 5
p levenshtein_distance("ABCDE", "ABCDE")    # 0



# doctest: abc and abc
# >> levenshtein_distance("abc", "abc") 
# => 0
# doctest: kitten and sitting
# >> levenshtein_distance("kitten", "sitting") 
# => 3
# doctest: aaaaa and bbbbb
# >> levenshtein_distance("aaaaa", "bbbbb") 
# => 5
def levenshtein_distance2(str1, str2)
  col, row = str1.size + 1, str2.size + 1
  d = row.times.inject([]){|a, i| a << [0] * col }
  col.times {|i| d[0][i] = i }
  row.times {|i| d[i][0] = i }

  str1.size.times do |i1|
    str2.size.times do |i2|
      cost = str1[i1] == str2[i2] ? 0 : 1
      x, y = i1 + 1, i2 + 1
      d[y][x] = [d[y][x-1]+1, d[y-1][x]+1, d[y-1][x-1]+cost].min
    end
  end
  d[str2.size][str1.size]
end
