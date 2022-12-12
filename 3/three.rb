def prioritise_bag(file)
    rucksacks = File.read(file).split("\n").map do |rucksack|
        rucksack[0..(rucksack.length / 2) - 1].split('') & rucksack[(rucksack.length / 2)..rucksack.length].split('')
    end

    grouped_rucksacks = []

    grouped_rucksacks.shift

    rucksacks.flatten!.map! do |item|
        if (item == item.upcase)
            item.ord - 38
        else
            item.ord - 96
        end
    end
    print rucksacks.sum
end

prioritise_bag('./input.txt')