class User < ApplicationRecord
  has_many :board_users
  has_many :boards, through: :board_users
  has_many :messages, through: :boards
  has_secure_password
end
