class Task < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  validates :name, presence: true
  validates :deadline, presence: true

  def complete
    self.is_finished = true
    self.save
  end
end
