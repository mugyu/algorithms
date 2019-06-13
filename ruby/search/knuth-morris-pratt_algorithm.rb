# KMP法(クヌース-モリス-ブラット法)

require 'pp'

def kmp(text, pattern)
  return 0 if pattern[0] == 0
  i = 1
  j = 0
  nxt = [nil, 0]
  while pattern[i] != 0
    return -1 if i >= pattern.size
    if pattern[i] == pattern[j]
      i += 1
      j += 1
      nxt[i] = j
    elsif j == 0
      i += 1
      nxt[i] = j
    else
      j = nxt[j]
    end
  end
  p nxt

  i = 0
  j = 0
  while text[i] != 0 and pattern[j] != 0
    if text[i] == pattern[j]
      i += 1
      j += 1
    elsif j == 0
      i += 1
    else
      j = nxt[j]
    end
  end

  return i - j if pattern[j] == 0 # found
  return nil                      # not found
end

#p SEARCH_STRING = "BCAABACABCCAABBC" + "\000"
p TEXT = "ABCABCABA" + "\000"
p PATTERN = "ABCABA" + "\000"
pp kmp(TEXT, PATTERN)
