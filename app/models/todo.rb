class Todo < ActiveRecord::Base
  attr_accessible :item, :user_id

  validates :item, presence: true
  validates :item, uniqueness: true


  belongs_to :user

  validates_uniqueness_of :item, :scope => :user_id
end
