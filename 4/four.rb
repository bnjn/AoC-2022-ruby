def elf_overlap(file)
    elf_arrays = File.read(file).split("\n").map do |team|
        team.split(',').map do |elf|
            elf.split('-').map(&:to_i)
        end
    end

    results = elf_arrays.map do |team|
        if team[0][0] <= team[1][0] && team[0][1] >= team[1][1]
            true
        elsif team[1][0] <= team[0][0] && team[1][1] >= team[0][1]
            true
        else
            false
        end
    end

   print results.count(false)
end

elf_overlap('./input.txt')