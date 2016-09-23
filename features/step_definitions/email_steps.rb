Then /^an email should have been sent to "(.*?)"$/ do |email|
  ActionMailer::Base.deliveries.empty?.should == false
  ActionMailer::Base.deliveries.first.to.first.should == email
end
