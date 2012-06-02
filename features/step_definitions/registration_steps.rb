Then /^I should see "(.*?)" registered for the event$/ do |name|
  page.should have_xpath("//ul[@id='people-list']/li/img[@title = '#{name}']")
end

Then /^I should not see "(.*?)" registered for the event$/ do |name|
  page.should_not have_xpath("//ul[@id='people-list']/li/img[@title = '#{name}']")
end
