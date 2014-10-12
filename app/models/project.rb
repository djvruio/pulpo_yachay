class Project < ActiveRecord::Base
	
	
	enum status: [:open, :close, :suspended, :transferred]
	after_initialize :set_default_status, :if => :new_record?

	validates :name, presence: true
	validates :description, length: { maximum: 150 }
	validates :estimated_budget, numericality: { greater_than_or_equal_to: 0 }
	
	def estimated?
		estimated_budget.blank? || estimated_budget.zero?
	end

	def set_default_status
    	self.status ||= :open
  	end

end
