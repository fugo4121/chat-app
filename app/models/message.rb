class Message < ApplicationRecord

  validates :content, presence: true

  belongs_to :room
  belongs_to :user

  # Messagesテーブルの各レコードと画像ファイルを管理するimageカラムの紐付け
  has_one_attached :image
  
end
