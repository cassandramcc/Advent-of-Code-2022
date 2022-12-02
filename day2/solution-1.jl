f = open("input.txt")

#A = rock, B = paper, C = scissors
#X = rock, Y = paper, Z = scissors
#1          2           3
#win = 6, draw = 3, lose = 0

@enum OpponentPlay A B C
@enum MyPlay X Y Z

function asEnum(play)
    if cmp(play,'A') == 0
        return Int(A)
    elseif cmp(play,'B') == 0
        return Int(B)
    elseif cmp(play,'C') == 0
        return Int(C)
    elseif cmp(play,'X') == 0
        return Int(X)
    elseif cmp(play,'Y') == 0
        return Int(Y)
    elseif cmp(play,'Z') == 0
        return Int(Z)
    end
end
    
function isLose(opp, me)
    if asEnum(opp) == 1 && asEnum(me) == 0
        return true
    elseif asEnum(opp) == 2 && asEnum(me) == 1
        return true
    elseif asEnum(opp) == 0 && asEnum(me) == 2
        return true
    end
    return false
end

function isDraw(opp, me)::Bool
    if asEnum(opp) == asEnum(me)
        return true
    else
        return false
    end
end

# Return the score
function result(opp, me)::Int
    if isDraw(opp, me)
        return 3
    elseif isLose(opp, me)
        return 0
    else
        return 6
    end
end

score = 0
for line in eachline(f)
    opponent = line[1]
    me = line[3]
    global score = score + asEnum(me) + 1 + result(opponent,me)
end

println(score)