packet = []
File.read('./input.txt').split('').each_with_index do |char, index|
    if packet.length == 4
        packet.shift
        packet << char
    else
        packet << char
    end

    if packet.uniq.length == 4
        puts 'Found start-of-packet!'
        puts 'start-of-packet marker: ' + packet.join
        puts 'The amount of chars before the start-of-packet marker is: ' + (index + 1).to_s
        break
    end
end