commands = File.read('./input.txt').split("\n")
fs_map = {}
current_dir = ''
prev_dir = ''

commands.each do |command|
    if command[0..3] == '$ cd'
        if command[5..command.length] == '..'
            buffer = current_dir[1..current_dir.length].split('/')
            buffer.pop
            prev_dir = current_dir
            current_dir = '/' + buffer.join('/')
            fs_map[current_dir][:size] += fs_map[prev_dir][:size]
        else
            if current_dir.length == 0
                current_dir = '/'
                if fs_map.key?(current_dir) == false
                    fs_map[current_dir] = {
                        size: 0,
                        files: {},
                        dirs: []
                    }
                end
            elsif current_dir.length == 1
                current_dir += command[5..command.length]
                if fs_map.key?(current_dir) == false
                    fs_map[current_dir] = {
                        size: 0,
                        files: {},
                        dirs: []
                    }
                end
            else
                current_dir += '/' + command[5..command.length]
                if fs_map.key?(current_dir) == false
                    fs_map[current_dir] = {
                        size: 0,
                        files: {},
                        dirs: []
                    }
                end
            end
        end
    elsif command =~ /\d+/
        file_name = command.match(/[A-Za-z.]+/)[0]
        file_size = command.match(/\d+/)[0]
        fs_map[current_dir][:size] += file_size.to_i
        fs_map[current_dir][:files].store(file_name, file_size.to_i)
    elsif command =~ /dir/
        if current_dir == '/'
            dir_name = current_dir + command[4..command.length]
        else
            dir_name = current_dir + '/' + command[4..command.length]
        end
        fs_map[current_dir][:dirs].push(dir_name)
    end
end

# fs_map.keys.each do |dir|
#     dir_info = fs_map.dig(dir)

#     dir_info.keys.each do |key|
#         value = dir_info.dig(key)

#         if value == []
#             pp dir
#         end
#     end
# end

# fs_map.each do |key, value|
#     pp key + "  " + value[:size].to_s
# end

# pp fs_map['/']

result = []

fs_map.each do |dir, info|
    if info[:size] <= 100000
        result.push(info[:size])
    end
end

pp result.sum
