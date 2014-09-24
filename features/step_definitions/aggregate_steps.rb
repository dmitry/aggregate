Before do
  Mongoid.connect_to('aggregate_test')
  Mongoid.purge!
  Aggregate.reset
end

Given(/^a code with:$/) do |string|
  # class_eval string
  eval string
end

# When(/^a code with:$/) do |string|
#   eval string
# end

Then(/^a code should result with "(.+)"$/) do |a, string|
  eval string
end