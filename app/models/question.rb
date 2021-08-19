class Question < ApplicationRecord
  belongs_to :room

  with_options presence: true do
  validates :title

  end

end
