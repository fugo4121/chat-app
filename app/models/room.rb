class Room < ApplicationRecord

  # userテーブルを中間テーブルを介して紐付け
  has_many :room_users
  has_many :users, through: :room_users

end