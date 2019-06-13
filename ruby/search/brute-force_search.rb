# 力任せ検索

require 'pp'

def brute_force_search(str, word)
  i = 0
  j = 0
  while str[i] != 0
    j += 1 while str[i + j] == word[j] and word[j] != 0
    return i if word[j] == 0
    j = 0
    i += 1
  end
  nil
end

#p SEARCH_STRING = "BCAABACABCCAABBC" + "\000"
p SEARCH_STRING = "BCAABACABC" + "\000"
p WORD = "ABC" + "\000"
p brute_force_search(SEARCH_STRING, WORD)
