# BM法(ボイヤー-ムーア法)の簡略版

require 'pp'

UCHAR_MAX = 256

def bm(text, pattern)
  len = pattern.size
  return nil if len == 0 # パターンの長さが0なら終わり
  tail = pattern[len- 1] # パターンの最後を控える
  i = 0
  if len == 1
    while i < text.size
      return i if text[i] == tail
      i += 1
    end
  else
    skip = Array.new(UCHAR_MAX, len)
    while i < len - 1
      skip[pattern[i].ord] = len - 1 - i
      i += 1
    end

    while i < text.size
      c = text[i]
      if c == tail
        j = len - 1
        k = i
        while pattern[j -= 1] == text[k -= 1]
          return k if j == 0
        end
      end
      i += skip[c.ord]
    end
  end
  nil
end

p TEXT = "PQRSTUABBAABBA" + "\000"
p PATTERN = "AABBA" + "\000"
p bm(TEXT, PATTERN)
