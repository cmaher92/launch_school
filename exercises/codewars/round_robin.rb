# sports league table ranking
# https://www.codewars.com/kata/5e0baea9d772160032022e8c

# round robin
# each team meets all other teams

# points
# a win gives a team 2 points
# a draw gives a team 1 point

# order of teams
# points
# scoring diff
# goals scored

# input
# int; number of teams in your league
# array of arrays; games; each item represents a played game with an array of four elements
   # [TeamA, TeamB, GoalA, GoalB]

# output
#  array; positions; the i-th item should be the position of the i-th team in your league
# if team 0 finished in the 6th position, place a 0 in that index
# remember index is the team number, and the int in the array is their position
# [3, 2, 1]
# this means that team 0 came in 3rd plcae
# team 1 came in 2nd place
# and team 2 came in first place

# create an array to hold each of the teams information
# [leaderboard]
# for each game [team, team, goals for, goals against]
    # team_a = game[0]
    # team_b = game[1]
    # team_a_goals = game[2]
    # team_b_goals = game[3]
    # outcome_a = [team, points, goals_for, goals_against]
    # outcome_b = same ^^
    # check leaderboard array to see if team_a has already played
        # if they haven't, add outcome to leaderboard
        # if they have, increment points, goals_for and goals_against

# sort the leaderboard by points
# generate output as an array, each index representing the team, each integer representing their ranking
require 'pry'

def calculate_points(team_a_goals, team_b_goals)
    team_a_points = 0
    team_b_points = 0
    if team_a_goals > team_b_goals
        return [2, 0]
    elsif team_b_goals > team_a_goals
        return [0, 2]
    else
        return [1, 1]
    end
end

def more_points?(team_1, team_2)
  team_1[1] > team_2[1]
end

def more_diff?(team_1, team_2)
  team_1[4] > team_2[4]
end

def more_goals?(team_1, team_2)
  team_1[2] > team_2[2]
end

def compute_ranks(teams_in_league, games)
    leaderboard = Array.new(teams_in_league) { Array.new }
    leaderboard.each { |result| 3.times { result <<  0 } }

    games.each do |game|
        team_a = game[0]
        team_b = game[1]
        team_a_goals = game[2]
        team_b_goals = game[3]

        points = calculate_points(team_a_goals, team_b_goals)
        team_a_points = points[0]
        team_b_points = points[1]
        leaderboard[team_a][0] += team_a_points
        leaderboard[team_b][0] += team_b_points
        leaderboard[team_a][1] += team_a_goals
        leaderboard[team_b][1] += team_b_goals
        leaderboard[team_a][2] += team_b_goals
        leaderboard[team_b][2] += team_a_goals
    end

   # calculate goal differential
    leaderboard.each do |team|
        team << team[1] - team[2]
    end

    leaderboard.each_with_index do |stats, idx|
        stats.unshift(idx)
    end

   leaderboard = leaderboard.sort { |a, b| b[1] <=> a[1] }
   leaderboard =  leaderboard.sort do |a, b|
       if a[1] == b[1]
           if b[4] == a[4]
               b[2] <=> a[2]
           else
               b[4] <=> a[4]
           end
       else
           b[1] <=> a[1]
       end
    end

    rank = 1
    rankings = []
    leaderboard.each_with_index do |team_info, index|
      if (index + 1) < leaderboard.size
        next_team_info = leaderboard[(index + 1)]
        # if they have the same points, diff, and goals for than the next team
        if !more_points?(team_info, next_team_info) && !more_diff?(team_info, next_team_info) && !more_goals?(team_info, next_team_info)
          rankings << rank
        else
          rankings << rank
          rank += rankings.count(rank)
        end
      else
        # it's the last one
        # if they have same points, diff, and goals for the last team, apply ranking
        # else
        #   rank +=1 and then apply
        prev_team_info = leaderboard[(index - 1)]
        # if they have the same points, diff, and goals for than the last team
        if !more_points?(team_info, prev_team_info) && !more_diff?(team_info, prev_team_info) && !more_goals?(team_info, prev_team_info)
          rankings << rank
        else
          rank += rankings.count(rank)
          rankings << rank
        end
      end
    end

    leaderboard.map! { |team_info| [team_info[0], rankings.shift] }
    leaderboard = leaderboard.sort { |a, b| a[0] <=> b[0] }
    leaderboard.map! { |team_info| team_info[1] }

end


# examples
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

p compute_ranks(number, games)
