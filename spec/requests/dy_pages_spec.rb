require 'spec_helper'

describe "DyPages" do
	
 	
 	describe "Home page" do 
 	   	it "should have the content 'Home'" do
 	   		visit root_path
 	   		expect(page).to have_content('Home')
 	   	end

 	   	it "should have the base title" do
 	   		visit root_path
 	   		expect(page).to have_title("ProjectTracker")
		end 	   		

 	end


end
   