class Project < ActiveRecord::Base
	
	has_many :tasks, dependent: :destroy
	has_many :memberships, dependent: :destroy
	has_many :users, through: :memberships
	

	enum status: [:open, :closed, :suspended, :transferred]
	
	has_many :alignments, dependent: :destroy
	has_many :goals, through: :alignments
	
	validates :name, presence: true
  #valida que ingrese hasta 255 caracteres y permite ingresar de igual forma el campo en blanco
  validates :description, length: { in: 0..255 },allow_blank: true

  #Me valida el ingreso de numeros con 2 decimales y mayor que cero

  validates :estimated_budget, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0 }

	def estimated?
		estimated_budget.blank? || estimated_budget.zero?
	end

end
