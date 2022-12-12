def prioritise_bag(file)

    grouped_rucksacks = []

    rucksacks = File.read(file).split(/(.+\n.+\n.+)/).each do |rucksack|
        grouped_rucksacks.push(rucksack.split("\n")) if rucksack != "\n"
    end

    grouped_rucksacks.shift

    uniq_items_score = grouped_rucksacks.map do |group|
        uniq_group = group.map do |rucksack|
          rucksack.chars.uniq
        end
        common_item = uniq_group[0] & uniq_group[1] & uniq_group[2]

          if (common_item[0] == common_item[0].upcase)
              common_item[0].ord - 38
          else
              common_item[0].ord - 96
          end
    end

    print uniq_items_score.sum
end

prioritise_bag('./input.txt')