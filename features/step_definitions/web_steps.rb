require "uri"
require "cgi"
require File.expand_path("../../support/paths", __FILE__)
require File.expand_path("../../support/selectors", __FILE__)

module WithinHelpers
  def within_locator(locator)
    locator ? within(*selector_for(locator)){ yield } : yield
  end
end

World(WithinHelpers)

When /^(.+) within (.*[^:])$/ do |substep, parent|
  within_locator(parent){ step substep }
end

When /^(.+) within (.+):$/ do |substep, locator, table_or_string|
  within_locator(locator){ step substep, table_or_string }
end

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I press "(.*?)"$/ do |button|
  click_button(button)
end

When /^I follow "(.*?)"$/ do |link|
  click_link(link)
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in(field, with: value)
end

When /^I fill in the following:$/ do |fields|
  fields.rows_hash.each do |field, value|
    fill_in(field, with: value)
  end
end

When /^I select "(.*?)" from "(.*?)"$/ do |value, field|
  select(value, from: field)
end

When /^I check "(.*?)"$/ do |field|
  check(field)
end

When /^I uncheck "(.*?)"$/ do |field|
  uncheck(field)
end

When /^I choose "(.*?)"$/ do |field|
  choose(field)
end

When /^I attach the file "(.*?)" to "(.*?)"$/ do |path, field|
  attach_file(field, File.expand_path(path))
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "(.*?)"$/ do |text|
  page.should have_no_content(text)
end

Then /^the "(.*?)" field(?: within (.+))? should contain "(.*?)"$/ do |field, locator, value|
  within_locator(locator) do
    field = find_field(field)
    value = field.tag_name == "textarea" ? field.text : field.value
    value.should == value
  end
end

Then /^the "(.*?)" field(?: within (.*))? should not contain "(.*?)"$/ do |field, locator, value|
  within_locator(locator) do
    field = find_field(field)
    value = field.tag_name == "textarea" ? field.text : field.value
    value.should_not == value
  end
end

Then /^the "(.*?)" checkbox(?: within (.+))? should be checked$/ do |label, locator|
  within_locator(locator) do
    find_field(label)["checked"].should be_true
  end
end

Then /^the "(.*?)" checkbox(?: within (.*))? should not be checked$/ do |label, locator|
  within_locator(locator) do
    find_field(label)["checked"].should be_false
  end
end

Then /^I should be on (.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end

Then /^I should have the following query string:$/ do |table|
  query = URI.parse(current_url).query
  actual = query ? CGI.parse(query) : {}
  expected = table.rows_hash.inject({}){|e,(k,v)| e[k] = v.split(",") }
  actual.should == expected
end
