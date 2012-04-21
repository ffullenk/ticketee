Given /^that project has a ticket:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |arg1, arg2|
  page.should have_content(arg1) and have_content(arg2)
end

Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user => User.find_by_email!(email))
    @project.tickets.create!(attributes)
  end
end