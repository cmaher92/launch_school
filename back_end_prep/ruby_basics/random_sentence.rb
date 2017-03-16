# Random sentence

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(names)
  return names.sample
end

def activity(activities)
  return activities.sample
end

def sentence(name, activity)
  return "#{name} #{activity}"
end

puts sentence(name(names), activity(activities))

