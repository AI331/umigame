class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: 'そのルーム名は使用できません' }
end
