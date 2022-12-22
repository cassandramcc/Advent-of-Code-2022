f = open("input.txt")
#f = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"

temp = []
count = 0

function rPop(a)
    p = pop!(reverse!(a))
    reverse!(a)
    return p
end

function pushBuffer(a,i)
    if length(a) == 4
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
    if length(noDupes) == 4
        println(count)
        break
    end
end