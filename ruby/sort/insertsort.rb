# インサートソート
require "pp"
data = [3, 9, 6, 1, 2]

def insertSort(data)
  length = data.length - 1

  (1..length).each do |i|
    (0...i).each do |j|
      # exclude
      next if data[j] <= data[i]
      # memo
      value = data[i]
      # shift
      (j...i).reverse_each { |x| data[x + 1] = data[x] }
      # insert
      data[j] = value
      p data
    end
  end
  data
end

p data
p insertSort(data)
