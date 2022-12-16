f = open("input.txt")

dupes = []

for line in eachline(f)
    a, b = SubString(line,1,Int(length(line)/2)), SubString(line,(Int(length(line)/2))+1,length(line))
    for item in a
        if findfirst(item, b) !== nothing
            push!(dupes,item)
            break
        end
    end
end

total = 0

for dupe in dupes
    if islowercase(dupe)
        global total = total + Int(dupe) - 96
    else
        global total = total + Int(dupe) - 38
    end
end

println(total)