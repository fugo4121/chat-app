class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      # roomとuserのidをキーとした中間テーブルとする
      # 作成したテーブルのカラムには、_idがつく
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
