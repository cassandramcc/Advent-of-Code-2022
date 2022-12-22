f = open("example.txt")

#Improvements - 
mutable struct File
    name
    size::Int64
    directory
end

mutable struct Directory
    name
    size::Int64
    contents::Vector{Union{Directory,File}}
    directory
end

function sizeDir(tree)
    count = 0
    for node in tree.contents
        if typeof(node) == File
            count += node.size
        else
            count += sizeDir(node)
        end
    end
    return count
end

nodes = []

function dfs(tree)
    for node in tree.contents
        if typeof(node) == Directory
            dfs(node)
            if sizeDir(node) <= 100000
                push!(nodes,node)
            end
        end
    end
end

root = Directory("/",0,[],nothing)

cwd = root

for line in eachline(f)
    println(line)
    cd = match(r"cd (.+)",line)
    dir = match(r"dir (.+)",line)
    file = match(r"(\d+) (.+)",line)
    if !isnothing(cd)
        if cd[1] == ".."
            global cwd = cwd.directory
        else
            if length(cwd.contents) != 0
                global cwd = cwd.contents[findfirst(x -> x.name == cd[1],cwd.contents)]
            end
        end
    end
    if !isnothing(dir)
        push!(cwd.contents,Directory(dir[1],0,[],cwd))
    end
    if !isnothing(file)
        push!(cwd.contents,File(file[2],parse(Int64,file[1]),cwd))
    end
end

display(root)

display(sizeDir(root))

dfs(root)

sum = 0

for node in nodes
    global sum += sizeDir(node)
end

display(sum)