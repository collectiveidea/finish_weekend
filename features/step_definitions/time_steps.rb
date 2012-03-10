When /^I wait (\d+) seconds?$/ do |count|
  sleep count.to_i
end

When /^I wait for payment processing$/ do
  sleep 2
end
