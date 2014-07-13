require 'spec_helper'

describe "DyPages" do
	
 	
 	describe "Home page" do 
 	   	it "should have the content 'Home'" do
 	   		visit '/mainpage/home'
 	   		expect(page).to have_content('Home')
 	   	end
 	end


end
   