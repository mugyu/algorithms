# 作りかけ
# インサートソート
require "pp"
data = [3, 9, 6, 1, 2]

def insertSort(data)
  length = data.length
  length.times do |i|
    next if i < 1
    length.times do |j|
      break if j > i
      if data[j] < data[i]
        value = data[j]
        data[j]  = data[i]
        data[i] = value
      end
    end
  end
end

insertSort(data)
