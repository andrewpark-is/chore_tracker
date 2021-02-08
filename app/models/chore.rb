class Chore < ApplicationRecord
  # relationships
  belongs_to :child
  belongs_to :task
  # validations
  validates_date :due_on
  # scopes
  scope :by_task, -> { joins(:task).order('tasks.name') }
  scope :chronological, -> { joins(:task).order('chores.due_on', 'tasks.name') }
  scope :done, -> { where('completed = ?', true) }
  scope :pending, -> { where('completed = ?', false) }
  scope :upcoming, -> { where('due_on >= ?', Date.today) }
  scope :past, -> { where('due_on < ?', Date.today) }
  # methods
  def status
    self.completed ? "Completed" : "Pending"
  end
end
