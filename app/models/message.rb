class Message < ApplicationRecord
 belongs_to :user
 belongs_to :room

 validates :messages_content, presence: true
end
