require 'pry'

def compute_ranks(nTeams, games)

    # creates an array of arrays
    # each array contains [[pts,diff,goals], team_num
    cnts = (0...nTeams).map{ |t| [[0,0,0],t] }

    # calculates points, goal differential, and goals for for each team
    games.each{ |tA,tB,gA,gB|
        [[tA,gA,gB],[tB,gB,gA]].each{ |t,g,go|
            cnt = cnts[t][0]
            # cnt = [pts, diff, goals]
            cnt[0] += 1 + (g<=>go) # calculates points, goals <=> goals_againt (1 if a win, 0 if a tie, -1 if a loss)
            cnt[1] += g-go # goal differential
            cnt[2] += g # goals for
        }
    }

    # sorts based on points
    cnts.sort!{ |a,b| b<=>a }

    # rnk = 0
    # out = [0, 0, 0, 0, 0, 0]
    # assigns rank to the out array
    rnk, out = 1, [0] * nTeams
    cnts.each_with_index{ |x,i|
        binding.pry
        rnk = i+1 if !i || x[0] != cnts[i-1][0]
        out[x.last] = rnk
    }
    return out
end

number = 6
games = [[0, 5, 2, 2],  # // Team 0 - Team 5 => 2:2
         [1, 4, 0, 2],  # // Team 1 - Team 4 => 0:2
         [2, 3, 1, 2],   #// Team 2 - Team 3 => 1:2
         [1, 5, 2, 2],  # // Team 1 - Team 5 => 2:2
         [2, 0, 1, 1],  # // Team 2 - Team 0 => 1:1
         [3, 4, 1, 1],  # // Team 3 - Team 4 => 1:1
         [2, 5, 0, 2],  # // Team 2 - Team 5 => 0:2
         [3, 1, 1, 1],  # // Team 3 - Team 1 => 1:1
         [4, 0, 2, 0]]  # // Team 4 - Team 0 => 2:0

compute_ranks(number, games)
