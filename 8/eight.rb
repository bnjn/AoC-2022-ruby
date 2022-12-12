grid = File.read('./input.txt').split("\n").map do |row|
    row.chars.map(&:to_i)
end

interior_map = {}

grid.each_with_index do |row, row_index|
    next if (row_index == 0) || (row_index == grid.length - 1)
    row.each_with_index do |cell, cell_index|
        next if (cell_index == 0) || (cell_index == row.length - 1)

        col = grid.map { |r| r[cell_index] }

        right = row[(cell_index + 1)..(row.length - 1)].all? { |tree_height| tree_height < cell }
        left = row[0..(cell_index - 1)].all? { |tree_height| tree_height < cell }
        up = col[0..(row_index - 1)].all? { |tree_height| tree_height < cell }
        down = col[(row_index + 1)..(col.length - 1)].all? { |tree_height| tree_height < cell }

        if right || left || up || down
            interior_map["x#{cell_index}y#{row_index}"] = { visible: true }
        else
            interior_map["x#{cell_index}y#{row_index}"] = { visible: false }
        end
    end
end

interior_count = interior_map.count { |cell, value| value == { visible: true } }

ext_count = (grid.length*2) + ((grid.length - 2)*2)

puts 'Total visible trees:'
puts interior_count + ext_count