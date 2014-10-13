class Organization < ActiveRecord::Base
  has_ancestry
  has_many :goals, dependent: :destroy
end
