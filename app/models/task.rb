class Task < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'


  def complete
    self.is_finished = true
    self.save
  end
end
