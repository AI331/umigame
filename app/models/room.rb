class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  validates :name, presence: true, uniqueness: { message: 'そのルーム名は使用できません' }
  has_many :messages
end
