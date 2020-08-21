class Message < ApplicationRecord

  belongs_to :room
  belongs_to :user

  # Messagesテーブルの各レコードと画像ファイルを管理するimageカラムの紐付け
  has_one_attached :image
  
  # 画像が存在しない時のみ、contentの空投稿をできなくする
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
