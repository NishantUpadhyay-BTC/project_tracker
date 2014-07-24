namespace :db do 
  desc "Fill database with sample data"
  task populate: :environment do

    99.times do |n|
      Name = Faker::Name.name
      Code = "example-#{n+1}@railstutorial.org"
      Description = Faker::Lorem.sentence(5)
      BillingType = "TNM"
      StartDate = Date.today - 10000 * rand()
      DeadlineDate =Date.today - 10000 * rand()
      EndDate = Date.today - 10000 * rand()
      gitHubUrl = "mygit.com"
      status = "Completed"
      clientid = rand(1..100)
      Project.create!(Name: Name, Code: Code, Description: Description, BillingType: BillingType, StartDate: StartDate, DeadlineDate: DeadlineDate, EndDate: EndDate, gitHubUrl: gitHubUrl, status: status, client_id: clientid)
    end
    
    99.times do |n|
      name = Faker::Name.name
      country = Faker::Name.name
      Client.create!(name: name, country: country)
    end

  end
end