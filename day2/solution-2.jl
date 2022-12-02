f = open("input.txt")

#A = rock, B = paper, C = scissors
#X = lose, Y = draw, Z = win
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

score = 0
for line in eachline(f)
    println("round ", line)
    opponent = line[1]
    me = line[3]
    play = 0
    roundResult = 0
    # must draw, choose same as opponent
    if cmp(me, 'Y') == 0
        roundResult = 3
        play = opponent
    # must lose
    elseif cmp(me, 'X') == 0
        roundResult = 0
        if cmp(opponent,'A') == 0
            play = 'C'
        elseif cmp(opponent, 'B') == 0
            play = 'A'
        elseif cmp(opponent, 'C') == 0
            play = 'B'
        end
        println(roundResult + asEnum(play) + 1)
    # must win
    elseif cmp(me, 'Z') == 0
        roundResult = 6
        if cmp(opponent,'A') == 0
            play = 'B'
        elseif cmp(opponent, 'B') == 0
            play = 'C'
        elseif cmp(opponent, 'C') == 0
            play = 'A'
        end
        println(roundResult + asEnum(play) + 1)
    end
    global score = score + asEnum(play) + 1 + roundResult
end

println(score)