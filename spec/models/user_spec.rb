require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",
        first_name: "山田", last_name: "太郎", first_kana: "ヤマダ", last_kana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "ヤマ", email: "", password: "00000000", password_confirmation: "00000000",
        first_name: "山田", last_name: "太郎", first_kana: "ヤマダ", last_kana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "ヤマ", email: "kkk@gmail.com", password: "", password_confirmation: "00000000",
        first_name: "山田", last_name: "太郎", first_kana: "ヤマダ", last_kana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "ユーザーの本名は名字と名前が空では登録できない" do
      user = User.new(nickname: "ヤマ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",
        first_name: "", last_name: "", first_kana: "ヤマダ", last_kana: "タロウ", birthday: "2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank","Last name can't be blank")
    end
    it "ユーザーの本名は全角での入力が必須であること" do
      user = User.new(nickname: "ヤマ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",
        first_name: "山田", last_name: "太郎", first_kana: "", last_kana: "", birthday: "2000-01-01")
      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include("First kana can't be blank","Last kana can't be blank")
    end
    it "生年月日が必須であること" do
      user = User.new(nickname: "ヤマ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000",
        first_name: "山田", last_name: "太郎", first_kana: "ヤマダ", last_kana: "タロウ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

