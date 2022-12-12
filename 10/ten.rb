cpu_register = 1
cpu_cycle = 0
exec_stack = []
result = []

def addx(x, current_register)
    current_register + x
end

File.read('./test_input.txt').split("\n").each do |instruction|
    cpu_cycle += 1

    case cpu_cycle
    when 20
        result.push(cpu_register * cpu_cycle)
    when 60
        result.push(cpu_register * cpu_cycle)
    when 100
        result.push(cpu_register * cpu_cycle)
    when 140
        result.push(cpu_register * cpu_cycle)
    when 180
        result.push(cpu_register * cpu_cycle)
    when 220
        result.push(cpu_register * cpu_cycle)
    end

    if !exec_stack.empty? && (exec_stack[0] + 2) == cpu_cycle
        cpu_register = addx(exec_stack[1], cpu_register)
        exec_stack = []
    end

    if instruction.match?(/(addx)+(?=\s)/)
        exec_stack = [cpu_cycle, instruction.match(/-\d+|\d+/)[0].to_i]
    end

    # if instruction.match?(/(noop)+/)

    # end
end

pp result
pp cpu_register
pp cpu_cycle