class Child < ApplicationRecord
	# relationships
	has_many :chores
	has_many :tasks, through: :chores
	# validations
	validates_presence_of :first_name, :last_name
	# scopes
  scope :alphabetical, -> { order('last_name, first_name') }	
  scope :active,       -> { where(active: true) }

  def name
  	first_name + " " + last_name
  end

  def points_earned
  	self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
  end
end
