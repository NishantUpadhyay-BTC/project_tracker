
class Project < ActiveRecord::Base
	belongs_to :client
	
	validates :Name, presence: true, length: { maximum: 50 }
	validates :Description, presence: true
	validates :BillingType, presence:true
	
	

	def self.in_search(search)
		if search.present?
			where('name = ?', search)
		else
			scoped
		end
	end

	def self.in_stat(stat)
		if stat.present?
			where('status = ?', stat)
		else
			scoped
		end
	end

	def self.in_id(id)
		if id.present?
			where('client_id = ?', id)
		else
			scoped
		end
	end

end
