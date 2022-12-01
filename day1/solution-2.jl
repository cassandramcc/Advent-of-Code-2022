f = open("input.txt","r")

elves = []
subCount = 0

for line in eachline(f)
    if length(line) != 0
        global subCount = subCount + parse(Int64, line)
    else
        push!(elves,subCount) 
        subCount = 0
    end
end

push!(elves, subCount)

max = [0,0,0]
for elf in elves
    # First element in the list is third highest elf
    if elf > max[1]
        # remove fourth highest element
        push!(max, elf)
        sort!(max)
        popfirst!(max)
    end
    
end
print(sum(max))

