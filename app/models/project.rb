class Project < ActiveRecord::Base
	belongs_to :client
	
	validates :Name, presence: true, length: { maximum: 50 }
	validates :Description, presence: true
	validates :BillingType, presence:true
	
	
	def self.search(search = "", stat = "",id = null)
	if search
			Project.where(["name = ? OR status = ? AND client_id= ? ", search, stat,id ])
			else
			Project.all
end
	end


end
