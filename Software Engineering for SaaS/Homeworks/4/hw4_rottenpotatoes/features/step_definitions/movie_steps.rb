# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  assert page.body =~ /#{e1}.*#{e2}/m
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    checkbox = "ratings_#{rating}"
    uncheck ? uncheck(checkbox) : check(checkbox)
  end
end

Then /I should not see any movies/ do
  assert page.all("#movies tbody tr").size == 0
end

Then /I should see all of the movies/ do
  number_of_movies = Movie.count

  assert page.all("#movies tbody tr").size == number_of_movies
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  assert Movie.find_by_title(movie).director == director
end
