

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

# Finds the size of a directory
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

#Determines if a directory could be deleted
function couldDelete(node)
    size = sizeDir(node)
    rootSize = sizeDir(root)
    # The free space currently available
    freeSpace = 70000000 - rootSize
    # The free space available after this node was deleted
    deleteSpace = freeSpace + size
    if deleteSpace >= 30000000
        return true
    else 
        return false
    end
end

# Finds all the directories that could be deleted
function dfs(tree)
    nodes = []
    for node in tree.contents
        if typeof(node) == Directory
            dfs(node)
            if couldDelete(node)
                push!(nodes,(node,sizeDir(node)))
            end
        end
    end
    return nodes
end

function createDirTree()
    f = open("example.txt")
    root = Directory("/",0,[],nothing)
    cwd = root

    for line in eachline(f)
        cd = match(r"cd (.+)",line)
        dir = match(r"dir (.+)",line)
        file = match(r"(\d+) (.+)",line)
        if !isnothing(cd)
            # The cwd will be the directory's parent directory
            if cd[1] == ".."
                cwd = cwd.directory
            else
                # Need the cwd to be the node struct that was created before, so find it in the list
                if length(cwd.contents) != 0
                    cwd = cwd.contents[findfirst(x -> x.name == cd[1],cwd.contents)]
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
    return root
end

function findSmallestDeleteNode(nodes)
    minSize = 1000000000000
    toDelete = nothing
    # Finding the smallest node that could be deleted
    for node in nodes
        if node[2] < minSize
            minSize = node[2]
            toDelete = node
        end
    end
    return toDelete
end

root = createDirTree()
# Finding all the nodes that could be deleted
deleteNodes = dfs(root)
toDelete = findSmallestDeleteNode(deleteNodes)

display(toDelete[2])