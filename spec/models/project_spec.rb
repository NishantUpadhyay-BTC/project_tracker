require 'spec_helper'

describe Project do
  before { @project = Project.new(Name: "testPro",Code: "code/code12.rb", Description: "this is my next description", BillingType: "tnm", StartDate: "12-07-2014", DeadlineDate: "23-07-2014", EndDate: "30-07-2014", gitHubUrl: "myurl.com", status: "poc" )}
	subject { @project }    
	it {should respond_to(:Name)}
	it {should respond_to(:Code)}
	it {should respond_to(:Description)}
	it {should respond_to(:BillingType)}
	it {should respond_to(:StartDate)}
	it {should respond_to(:DeadlineDate)}
	it {should respond_to(:EndDate)}
	it {should respond_to(:gitHubUrl)}
	it {should respond_to(:status)}
	it {should be_valid}
	describe "when name Name is not present " do
		before { @project.Name = " "}
		it {should_not be_valid}
	end
	describe "when  Description is not present " do
		before { @project.Description = " "}
		it {should_not be_valid}
	end
	describe "when BillingType  is not present " do
		before { @project.BillingType = " "}
		it {should_not be_valid}
	end

	describe "when name is too long" do
		before { @project.Name = "a" * 51 }
		it { should_not be_valid }
	end
end
