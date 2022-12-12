time_to_process = Time.now
cleaned_input_rows = File.read('./crates.txt').split(/\n/).map do |row|
    row.split(/(.{4})|(.{3})/).select { |crate| crate != "" }.map(&:strip)
end

cleaned_input_rows.pop

crates = cleaned_input_rows.transpose.map { |col| col.delete_if { |crate| crate == "" } } 

moves = File.read('./moves.txt').split(/\n/).map { |move| move.scan(/\d+/) }

moves.each do |move|
    system('clear')
    print crates.map { |row| row.reverse.join + "\n" }.join
    move_from_index = move[1].to_i - 1
    move_to_index = move[2].to_i - 1
    amount_to_move = move[0].to_i
    amount_to_move.times do
        crates[move_to_index].unshift(crates[move_from_index].shift)
    end
    system('clear')
    print crates.map { |row| row.reverse.join + "\n" }.join
    sleep(0.1)
end

system('clear')
print crates.map.with_index { |crate, i| "Stack " + (i + 1).to_s + ": " + crate.reverse.join + "\n" }.join
puts "Top crates after moves: " + crates.map { |row| row[0] }.join.gsub(/[^A-Z]/, '')

puts "Took " + (Time.now - time_to_process).to_s + "s to process"
