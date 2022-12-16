f = open("input.txt")

using Pipe

total = 0

for line in eachline(f)
    elves = split(line,',')
    elf1 = elves[1]
    elf2 = elves[2]

    elf1numbers = @pipe split(elf1,"-") .|>
                        parse(Int32,_)
    elf2numbers = @pipe split(elf2,"-") .|>
                        parse(Int32,_)
    if (elf2numbers[2] >= elf1numbers[2] && elf2numbers[1] <= elf1numbers[1]) || (elf1numbers[2] >= elf2numbers[2] && elf1numbers[1] <= elf2numbers[1])
        global total += 1
    end
end

println(total)