class Room < ApplicationRecord

  validates :name, presence: true

  # userテーブルを中間テーブルを介して紐付け
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy

  has_many :messages, dependent: :destroy

end
