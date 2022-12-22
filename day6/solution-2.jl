f = open("input.txt")
#f = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"

temp = []
count = 0

function rPop(a)
    p = pop!(reverse!(a))
    reverse!(a)
    return p
end

function pushBuffer(a,i)
    if length(a) == 14
        rPop(a)
    end
    push!(a,i)
end

for c in read(f)
    println(c)
    pushBuffer(temp,c)
    global count += 1

    noDupes = unique(temp)
    println(temp)
    if length(noDupes) == 14
        println(count)
        break
    end
end