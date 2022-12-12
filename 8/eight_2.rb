grid = File.read('./input.txt').split("\n").map do |row|
    row.chars.map(&:to_i)
end

scenic_map = {}

def find_viewing_distance(trees, current_cell)
    viewing_distance = 0
    trees.each_with_index do |tree_height, index|
        if tree_height >= current_cell
            viewing_distance += 1
            break
        end
        viewing_distance += 1
    end
    viewing_distance
end

grid.each_with_index do |row, col_index|
    row.each_with_index do |cell, row_index|

        col = grid.map { |r| r[row_index] }

        coords = "x#{row_index+1}y#{col_index+1}"

        right = row_index == (row.length - 1) ? [] : row[(row_index + 1)..(row.length - 1)]
        left = row_index == 0 ? [] : row[0..(row_index - 1)].reverse
        up = col_index == 0 ? [] : col[0..(col_index - 1)].reverse
        down = col_index == (col.length - 1) ? [] :  col[(col_index + 1)..(col.length - 1)]

        scenic_map[coords] = {
            right: find_viewing_distance(right, cell),
            left: find_viewing_distance(left, cell),
            up: find_viewing_distance(up, cell),
            down: find_viewing_distance(down, cell),
        }

        scenic_map[coords].store(:score, scenic_map[coords].values.inject(1) { |total, distance| total * distance })
    end
end

highest_score = scenic_map.values.map { |tree| tree.dig(:score) }.max

puts "Highest score is: #{highest_score}"