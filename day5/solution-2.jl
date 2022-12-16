f = open("input.txt")


file = read(f,String)

boxes, moves = split(file,"\n\n")

b = [Vector{Char}() for x=1:9]

boxesReg = r"(\s\s\s|[A-Z])[^0-9]"

extractedBoxes = eachmatch(boxesReg,boxes)

subCount = 1
for e in extractedBoxes
    if occursin(" ",e[1])
        #nothing
    else
        push!(b[subCount],only(e[1]))
    end
    global subCount += 1
    if subCount == 10
        subCount = 1
    end
end
display(reverse!.(b))

c = 1
moves = split(moves,"\n")
display(moves)
for move in moves
    println(move)
    num = match(r"e\s(\d+)",move)[1]
    from = match(r"m\s(\d)",move)[1]
    to = match(r"o\s(\d)",move)[1]
    temp = []
    for n in 1:parse(Int64,num)
        p = pop!(b[parse(Int64,from)])
        push!(temp,p)
    end
    for n in reverse!(temp)
        push!(b[parse(Int64,to)],n)
    end
    display(b)
    global c += 1
end

display(b)