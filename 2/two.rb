# rock(a or x) =1, paper(b or y) =2, scissors(C or z) = 3

def decryptStrategy(file)
    rounds = File.read(file).split("\n").map do |round|
        score = 0 if round[2] == 'X'
        score = 3 if round[2] == 'Y'
        score = 6 if round[2] == 'Z'

        if (round[0] == 'A' && round[2] == 'Y') || (round [0] == 'C' && round[2] == 'Z') || (round [0] == 'B' && round[2] == 'X')
            score += 1
        elsif (round[0] == 'B' && round[2] == 'Y') || (round [0] == 'A' && round[2] == 'Z') || (round [0] == 'C' && round[2] == 'X')
            score += 2
        else
            score += 3
        end
        score
    end
    puts rounds.sum
end

decryptStrategy('./input.txt')