require 'rails_helper'

RSpec.describe "チャットルームの削除機能", type: :system do
  before do
    # ユーザー、使用ルーム情報をもつ中間テーブル作成、及び紐づくユーザー、ルームテーブル作成
    @room_user = FactoryBot.create(:room_user)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されていること' do
    # サインインする(先ほど作成した中間テーブルの情報からユーザー情報を引っ張り出して、インスタンスよりサインイン)
    sign_in(@room_user.user)

    # 作成されたチャットルームへ遷移する
    click_on(@room_user.room.name)

    # メッセージ情報を5つDBに追加する
    # 作成ルーム、ログインユーザーのメッセージを5回送信
    FactoryBot.create_list(:message, 5, room_id: @room_user.room.id, user_id: @room_user.user.id)

    # 「チャットを終了する」ボタンをクリックすることで、作成した5つのメッセージが削除されていることを確認する
    # 作成ルームで送信したメッセージが5つ消えていることを確認
    expect{
      find_link("チャットを終了する",  href: room_path(@room_user.room)).click
    }.to change { @room_user.room.messages.count }.by(-5)

    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end
end