class Task < ApplicationRecord
	belongs_to :child
	belongs_to :task
	# relationships
	has_many :chores
	has_many :children, through: :chores
	# validations
	validates_presence_of :name
	validates_numericality_of :points, only_integer: true, greater_than: 0
	# scopes
	scope :alphabetical, -> { order('name') }
	scope :active,       -> { where(active: true) }
end
