# ナップサック問題
require "pp"
data = [
#  [2, 3],
#  [1, 2],
#  [3, 6],
#  [2, 1],
#  [1, 3],
#  [5, 85],
  #w,v
  [2, 3],
  [1, 2],
  [3, 6],
  [2, 1],
  [1, 3],
  [5, 85],
]

payload = 8

def napzak(data, payload)
  # initialize
  dp = Array.new(1, Array.new(payload + 1, 0))

  # main loop
  data.length.times do |i|
    # preparing each row
    dp[i + 1] = []
    # fetch weight and value
    w, v = data[i]
    # loop each item
    (payload + 1).times do |j|
      #if j < w
      #  dp[i + 1][j] = dp[i][j]
      #  next
      #end
      #v1 = dp[i][j - w] + v
      #v2 = dp[i][j]
      #dp[i + 1][j] = v1 > v2 ? v1 : v2
      dp[i + 1][j] = [j < w ? 0 : dp[i][j - w] + v, dp[i][j]].max
    end
  end
  pp dp
  dp[-1][-1]
end
p napzak(data, payload)

# => [[0, 0, 0, 0, 0, 0, 0, 0, 0],
# =>  [0, 0, 3, 3, 3, 3, 3, 3, 3],
# =>  [0, 2, 3, 5, 5, 5, 5, 5, 5],
# =>  [0, 2, 3, 6, 8, 9, 11, 11, 11],
# =>  [0, 2, 3, 6, 8, 9, 11, 11, 12],
# =>  [0, 3, 5, 6, 9, 11, 12, 14, 14],
# =>  [0, 3, 5, 6, 9, 85, 88, 90, 91]]
# => 91
