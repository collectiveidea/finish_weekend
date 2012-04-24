Given /^I am logged in as "([^"]*)"$/ do |user|
  username, password = user.split("/")
  FactoryGirl.create(:user, username: username, password: password)
  visit '/sessions/new'
  fill_in 'Username', with: username
  fill_in 'Password', with: password
  click_button 'Sign In'
end
