require 'spec_helper'

describe "Viewing the list of Images" do
  
  it "shows the images"
  visit 'http://localhost:3000/images'

  should have_selector('img')
end