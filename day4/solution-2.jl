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
    elf1low, elf1high = elf1numbers
    elf2low, elf2high = elf2numbers
    if (elf2numbers[2] >= elf1numbers[2] && elf2numbers[1] <= elf1numbers[1]) || (elf1numbers[2] >= elf2numbers[2] && elf1numbers[1] <= elf2numbers[1]) || (elf2low <= elf1high && elf2low >= elf1low) || (elf1low <= elf2high && elf1low >= elf2low)
        global total += 1
        println(line)
    end
end

println(total)