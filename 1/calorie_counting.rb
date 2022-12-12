calorie_array = File.read('inventory.txt').split("\n")

calorie_arrays = Array.new(calorie_array.count('')) { [] }

counter = 0

calorie_arrays.each_with_index do |arr, index|
  (calorie_array[counter..calorie_array.length]).each do |n|
    counter += 1
    break unless n != ''

    arr.push(n.to_i)
  end
end

calorie_arrays.map!(&:sum)

puts calorie_arrays.max

calorie_arrays.sort!.reverse!

puts calorie_arrays[0..2].sum
