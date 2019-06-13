# 番兵付きリニアサーチ・アルゴリズム

def sentinel_linear_search(a, n, v)
  a[n] = v
  k = 0
  while a[k] != v
    k = k + 1
  end
  return "found." if k < n
  return "not found."
end

p array = [31, 41, 59, 26, 53]
puts 26
puts sentinel_linear_search(array, array.size, 26)
puts 99
puts sentinel_linear_search(array, array.size, 99)
