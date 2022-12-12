def elf_overlap(file)
    elf_arrays = File.read(file).split("\n").map do |team|
        team.split(',').map do |elf|
            array = elf.split('-').map(&:to_i)
            (array[0]..array[1])
        end
    end

    results = elf_arrays.map do |team|
        (team[0].to_a & team[1].to_a).empty?
    end

   print results.count(false)
end

elf_overlap('./input.txt')