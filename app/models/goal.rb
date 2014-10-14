class Goal < ActiveRecord::Base
  belongs_to :organization
  default_scope -> {order('created_at DESC')}
  validates :organization_id, presence: true
  validates :name, presence: true, length: { maximum: 150 }
end
