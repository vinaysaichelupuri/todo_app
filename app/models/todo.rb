class Todo < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :status, inclusion: { in: %w[pending completed] }

end
