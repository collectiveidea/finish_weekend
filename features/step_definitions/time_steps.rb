Given /^it is "([^"]+)"$/ do |time|
  Timecop.travel(Time.zone.parse(time))
end

Given /^time stands still$/ do
  Timecop.freeze
end

When /^I wait (\d+) seconds?$/ do |count|
  sleep count.to_i
end

When /^I wait for payment processing$/ do
  sleep 4
end
