packet = []
File.read('./input.txt').split('').each_with_index do |char, index|
    if packet.length == 14
        packet.shift
        packet << char
    else
        packet << char
    end

    if packet.uniq.length == 14
        puts 'Found start-of-message packet!'
        puts 'start-of-message marker: ' + packet.join
        puts 'The amount of chars before the start-of-message marker is: ' + (index + 1).to_s
        break
    end
end