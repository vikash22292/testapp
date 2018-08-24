class TodoList < ApplicationRecord
  belongs_to :user
  enum status: %i[active completed]

  validates :title, presence:true
end
