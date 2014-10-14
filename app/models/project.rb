class Project < ActiveRecord::Base
	
	has_many :tasks, dependent: :destroy
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships
	
	enum status: [:open, :close, :suspended, :transferred]
	
	validates :name, presence: true
	validates :description, length: { maximum: 150 }
	validates :estimated_budget, numericality: { greater_than_or_equal_to: 0 }
	
	def estimated?
		estimated_budget.blank? || estimated_budget.zero?
	end

end
