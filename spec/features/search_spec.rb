require 'spec_helper'
require 'capybara/rspec'
	describe "Search page" do
context "when logged in" do

			it "should have search text" do
				visit "http://localhost:5000/search"
				expect(page).to have_text("search");
	end
end
context "when logged out" do 
	it "should have Login with Instagram" do
				visit "http://localhost:5000/search"
				expect(page).to have_text('Login with Instagram')
	end
end
end