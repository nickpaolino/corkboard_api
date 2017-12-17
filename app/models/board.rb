class Board < ApplicationRecord
  has_many :messages
  has_many :board_users
  has_many :users, through: :board_users

  def self.all_subjects
    self.all.map {|board| board.subject }.uniq
  end
end
