class User < ApplicationRecord
  has_many :messages
  has_many :media
  has_many :board_users
  has_many :boards, through: :board_users
  has_secure_password

  def formatted_boards
    board_array = []

    self.board_users.each do |board_user|
      board_object = {
        id: board_user.board.id,
        subject: board_user.board.subject,
        public: board_user.board.public,
        is_admin: board_user.is_admin
      }

      board_array << board_object
    end

    return board_array
  end
end
