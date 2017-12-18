class Board < ApplicationRecord
  has_many :messages
  has_many :media
  has_many :board_users
  has_many :users, through: :board_users

  def self.all_subjects
    self.all.map {|board| board.subject }.uniq
  end

  def format_board
    board_hash = {}

    users_array = []

    self.board_users.each do |board_user|
      user_hash = {
        id: board_user.user.id,
        username: board_user.user.username,
        is_admin: board_user.is_admin
      }

      users_array << user_hash
    end

    return {
      id: self.id,
      subject: self.subject,
      public: self.public,
      users: users_array,
      media: self.media,
      messages: self.messages
    }
  end
end
