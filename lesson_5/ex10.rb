arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.map do |hash|
  hash.map do |key, value|
    hash[key] = value += 1
    hash
  end
end

p arr2
