f = open("input.txt")

#A = rock, B = paper, C = scissors
#X = lose, Y = draw, Z = win
#1          2           3
#win = 6, draw = 3, lose = 0

@enum OpponentPlay A B C
@enum MyPlay X Y Z