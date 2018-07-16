# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.detect { |i| i[:id] == id }
end

def experienced?(candidate)
  if candidate[:years_of_experience] >= 2
    true
  else
    false
  end
end

def qualified_candidates(candidates)
    candidates.select { |i| i[:years_of_experience] >= 2 &&
    i[:github_points] >= 100 &&
    findLanguage(i[:languages]) &&
    applied(i[:date_applied]) &&
    i[:age] > 17}
end

def findLanguage(input)
  input.detect {|i| i == 'Ruby' || i == 'Python'}
end

def applied(input)
  today = 0.days.ago.to_date
  total_days = today - input
  if total_days <= 15
    true
  end
end

def ordered_by_qualifications(candidates)
  candidates.sort { |a, b| [a[:years_of_experience], a[:github_points]] <=> [b[:years_of_experience], b[:github_points]]}.reverse
end
