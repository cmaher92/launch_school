# Your company built an in-house calendar tool called HiCal
# You want to add a feature to see the times in a day when
# everyone is available

# To do this you'll need to know when any team is having a meeting

# In HiCal, a meeting is stored as an array of integers [start_time, end_time]
# These integers represent the number of 30-minute blocks past 9:00am

# For example
# [2, 3] # meeting from 10 - 10:30 am
# [6, 9] # meeting from 12 - 1:30pm

# Write a method merge_ranges() that takes an array of multiple meeting time ranges
# and returns an array of condensed ranges.

# Given
# [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
# Return
# [[0, 1], [3, 8], [9, 12]]

# Do not assume meetings are in order

# ----------------------

# < Array of arrays
#   - subarray: contains two integers, start_time, end_time
# > Array of arrays
#   - returns an array of condensed ranges

# Understanding
# [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
#  - [09:00 - 09:30]
#  - [10:30 - 11:30]
#  - [11:00 - 13:00]
#  - [14:00 - 15:00]
#  - [13:30 - 14:00]

# meetings from 9 - 9:30 -> [0, 1]
# meetings from 10:30 - 13:00 -> [3, 8]
# meetings from 13:30 - 15:00 -> [9, 12]
# returns
# [[0, 1], [3, 8], [9, 12]]

# order by start times -> [[0, 1], [3, 5], [4, 8], [9, 10], [10, 12]]
# - from lowest to largest of the 0th-index of the subarray
#   - sort subarray by meeting start_time
# find each distinct meeting times
#   for each meeting
#   - set start_time if nil
#   - set end_time if nil
#   - check if there is time between last meeting and current meeting
#   - (if current_start_time <= last_time)
#     - if there isn't time between meetings (last meeting ends after this meeting starts)
#       - check which meeting is longer
#       - current_end_time > end_time ?
#         - if this meeting lasts longer, set end_time to the current meetings end time
#         - if this meeting isn't as long, next meeting
#     - if there is time between meetings 
#       - save start_time, end_time to meetings array
#       - reset start_time to current start_time
#       - reset end_time to current end_time
#       - next
#  - check if this is the last meeting
#  - if it is, append start_time, end_time to meetings array
require 'pry'

# def merge_ranges(meetings)
#   meetings = meetings.sort_by { |meeting| meeting[0] } # sort meetings by start_time
#   meeting_ranges = []
#   start_time      = nil
#   end_time        = nil
#   meetings.each do |meeting|
#     current_start_time = meeting[0]
#     current_end_time   = meeting[1]

#     if start_time.nil?
#       start_time = current_start_time
#       end_time   = current_end_time
#       next
#     end

#     # binding.pry
#     if current_start_time <= end_time # this meeting start before last meeting ended?
#       end_time = current_end_time if current_end_time > end_time # if this meeting ends later than last meeting, save this as end time
#     else
#       meeting_ranges << [start_time, end_time]
#       start_time = current_start_time
#       end_time = current_end_time
#     end

#     if meeting == meetings.last
#       meeting_ranges << [start_time, end_time]
#     end
#   end
#   meeting_ranges
# end

# Interview cake breakdown
# Simplify problem into two meetings
# [[1, 3], [2, 4]]
# Check if they overlap
#   1. meeting with earlier start time if the first meeting
#   2. if the end time of the first meeting and the start time of the second meeting are equal or great thean the second
#      we merge the two meetings into one time range
#      - take the start time of the first meeting
#      - end time of the later of the two meetings end times
#   3. Otherwise, we leave them separate
# Big O Result: O(n**2) because we're comparing all pairs of meetings

# Faster
# 1. sort meetings by start time
# 2. We can merge the previous meeting with the current, so we do
# 3. We can't merge the current meetint with the pervious meeting
#     - add the current meeting since it doesn't overlap

string = 'hi how are you'

  def merge_ranges(meetings)
  # Sort by start time.
  sorted_meetings = meetings.sort

  # Initialize merged_meetings with the earliest meeting.
  merged_meetings = [sorted_meetings[0]]

  sorted_meetings[1..-1].each do |current_meeting_start, current_meeting_end|
    last_merged_meeting_start, last_merged_meeting_end = merged_meetings[-1]

    # If the current meeting overlaps with the last merged meeting, use the
    # later end time of the two.
    if current_meeting_start <= last_merged_meeting_end
      merged_meetings[-1] = [
        last_merged_meeting_start,
        [last_merged_meeting_end, current_meeting_end].max
      ]
    else
      # Add the current meeting since it doesn't overlap.
      merged_meetings << [current_meeting_start, current_meeting_end]
    end
  end

  merged_meetings
end

p merge_ranges([[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]) == [[0, 1], [3, 8], [9, 12]]
p merge_ranges([[1, 2], [2, 3]]) == [[1, 3]]
p merge_ranges([[1, 5], [2, 3]]) == [[1, 5]]
p merge_ranges([[1, 10], [2, 6], [3, 5], [7, 9]]) == [[1, 10]]
