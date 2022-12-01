f = open("input.txt","r")

elves = []
subCount = 0

for line in eachline(f)
    println(line)
    if length(line) != 0
        global subCount = subCount + parse(Int64, line)
        println("subcount ",subCount)
    else
        println("will push ",subCount)
        push!(elves,subCount) 
        subCount = 0
    end
end

push!(elves, subCount)

println(elves)

max = 0
for elf in elves
    if elf > max
        global max = elf
    end
end

print(max)

