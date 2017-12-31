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

    board_user_ids = []

    self.board_users.each do |board_user|
      user_hash = {
        id: board_user.user.id,
        username: board_user.user.username,
        is_admin: board_user.is_admin
      }

      users_array << user_hash
    end

    self.board_users.each do |board_user|
      board_user_ids << board_user.id
    end

    return {
      id: self.id,
      subject: self.subject,
      public: self.public,
      users: users_array,
      media: self.media,
      messages: self.messages,
      board_users: board_user_ids
    }
  end

  def format_messages
    message_array = []

    self.messages.each do |message|
      message_hash = {
        content: message.content,
        username: message.user.username
      }

      message_array << message_hash
    end

    return message_array
  end
end
