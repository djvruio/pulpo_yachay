class Task < ActiveRecord::Base
  #has_one :state
  belongs_to :state
  belongs_to :project
  belongs_to :user
  belongs_to :assigned, :class_name => "User", :foreign_key => "assigned_to_id"

  attr_reader :task_time

  enum complexity: [:easier, :easy, :medium, :dificult, :very_dificult]

  #enum complexity: [:easier,:easy,:medium,:difficult,:hard]

  enum score: [:bad, :more_or_less, :good]
  #enum status: [:open, :close, :delayed, :in_progress]

  #after_initialize :set_default_status, :if => :new_record?
  after_initialize :set_default_score, :if => :new_record?
  after_initialize :set_default_complexity, :if => :new_record?
  after_initialize :set_default_deadline, :if => :new_record?

  validates :description, presence: true


  def set_default_deadline
    if self.deadline.present?
      self.deadline = "#{self.deadline.strftime("%Y-%m-%d")}"
    else
      self.deadline = nil
    end
  end

  #validates :deadline, presence: true

  #def task_time=(time)
  #  if self.deadline.present? && time.present?
  #    self.deadline = "#{self.deadline.strftime("%Y-%m-%d")} #{time}"
  #  end
  #end

  #def task_time
  #  self.deadline.strftime("%I:%M %P") if self.deadline
  #end


  def set_default_complexity
    self.complexity ||= :low
  end

  def set_default_score
    self.score ||= :more_or_less
  end

  #def set_default_status
  #  self.status ||= :open
  #end

end
