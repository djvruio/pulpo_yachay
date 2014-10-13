class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  enum complexity: [:low, :medium, :high]
  enum score: [:bad, :more_or_less, :good]
  enum status: [:open, :close, :delayed, :in_progress]

  #after_initialize :set_default_status, :if => :new_record?
  #after_initialize :set_default_score, :if => :new_record?
  #after_initialize :set_default_complexity, :if => :new_record?

  validates :description, presence: true
  
  # def set_default_complexity
  #     self.complexity ||= :low
  # end

  # def set_default_score
  #     self.score ||= :more_or_less
  # end

  # def set_default_status
  #     self.status ||= :open
  # end

end
