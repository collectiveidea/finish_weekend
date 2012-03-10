Then /^\$(\d+(?:\.\d{2})?) should have been charged$/ do |amount|
  charged.should == amount.to_f
end
