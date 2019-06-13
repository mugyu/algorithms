# 曖昧検索 approximate pattern matching
#
# あるパターン文字を複数のテキストとマッチングを行い
# マッチしたテキストを配列に置く。その際、パターン文字
# がテキストの左辺に偏っているものほど順位を高くする。

require 'pp'

def matching(text, pattern)
  ptn = pattern.downcase.split(//)
  len = ptn.length
  point = 0
  i = 0
  text.downcase.split(//).each_with_index do |x, j|
    if x == ptn[i]
      point += j
      i += 1
      return [text, point] if i > len - 1
    end
  end
  nil
end

pattern = "te"
texts = [
  "AdobePhotoshop",
  "Finder",
  "Displays.prefPane",
  "Displays.prefPane",
  "Thunderbird",
  "Safari",
  "Terminal",
  "Terminal",
  "iTunes"
]

hit = []
texts.each do |text|
  if val = matching(text, pattern)
    hit << val
  end
end
pp hit.sort_by{|v|v[1]}.map{|v|v[0]}
