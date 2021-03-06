# Given /^I go to the login page$/ do 
#   #Pending
#   fail "Unimplemented"
# end

Given /^I am on the register account page$/ do 
  #Pending
  fail "Unimplemented"
end


# ====================================================== #


And /^The tutee "(.*)" with the password "(.*)" exists/ do |username, pass|
  tutee = Tutee.new
  tutee.email = username
  tutee.password = pass
  tutee.save!
end

And /^The tutor "(.*)" with the password "(.*)" exists/ do |username, pass|
  tutor = Tutor.new
  tutor.email = username
  tutor.password = pass
  tutor.save!
end

And /^The admin "(.*)" with the password "(.*)" exists/ do |username, pass|
  admin = Admin.new
  admin.email = username
  admin.password = pass
  admin.save!
end

When /^(?:|I )press the button "Tutor Login"$/ do
  page.find("#tutor-login").click
end

When /^(?:|I )press the button "Tutee Login"$/ do
  page.find("#tutee-login").click
end

Then /^I should be on the "(.*)" page$/ do |pagetype|
  #Pending
  fail "Unimplemented"
end

When /^I select "(.*)" for "(.*)"$/ do |field, role|
  #Pending
  fail "Unimplemented"
end



Then /^I should be redirected to the "(.*)" form$/ do |form|
  #Pending
  fail "Unimplemented"
end

