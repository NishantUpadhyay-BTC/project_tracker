class Project < ActiveRecord::Base
	validates :Name, presence: true, length: { maximum: 50 }
	validates :Description, presence: true
	validates :BillingType, presence:true
end
