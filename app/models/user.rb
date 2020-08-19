class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  # roomテーブルを中間テーブルを介して紐付け
  has_many :room_users
  has_many :rooms, through: :room_users


end
