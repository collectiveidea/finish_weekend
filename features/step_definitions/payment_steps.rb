Then /^\$(\d+(?:\.\d{2})?) should have been charged$/ do |amount|
  new_payments.should == amount.to_f
end
