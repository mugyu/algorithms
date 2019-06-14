# modulo m でのa逆数
def invert(x, y)  
  a = y          
  b = x % y      
  p = 0
  q = 1
  v = 0
  u = 1
  while q > 0 
    p = a / b
    q = a % b
    w = v - (p * u)
    a = b
    b = q
    v = u
    u = w
  end
  v % y
end

printf "22371 * (%d) mod 10093 = 1\n",invert(22371,10093)
