f = open("input.txt")

sublist = []
triples = []
for line in eachline(f)
    push!(sublist,line)
    if length(sublist) == 3
        push!(triples,sublist)
        global sublist = []
    end
end

println(triples)

dupes = []

for triple in triples
    for item in triple[1]
        if findfirst(item, triple[2]) !== nothing && findfirst(item, triple[3]) !== nothing
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