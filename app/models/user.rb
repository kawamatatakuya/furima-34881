class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true 
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[一-龥]/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶ一]/ }
  validates :first_name, presence: true, format: { with: /\A[一-龥]/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ一]/ }
  validates :birth_date, presence: true
end

# format: { with: /\A[一-龥]/ }
# validates :last_name, presence: true, format: { with: /一-龥/ }
# validates :last_name_kana, presence: true, format: { with: /ァ-ヶ一/ }
# validates :first_name, presence: true, format: { with: /一-龥/ }
# validates :first_name_kana, presence: true, format: { with: /ァ-ヶ一/ }
# , format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
# , length: { minimum: 6 }
# /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,}$/
# format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
# format: { with: /a-z{1}\d{1}/ }
# , match:(/a-z\d/)
# , match:(/一-龥/)
# , match:(/ァ-ヶ/)
# | Column             | Type                | Options                     |
# |--------------------|---------------------|-----------------------------|
# | email              | string              | null: false , unique: true  |
# | encrypted_password | string              | null: false                 |
# | nickname           | string              | null: false                 |
# | last_name          | string              | null: false                 |
# | last_name_kana     | string              | null: false                 |
# | first_name         | string              | null: false                 |
# | first_name_kana    | string              | null: false                 |
# | birth_date         | date                | null: false                 |
# 新規登録/ユーザー情報
# メールアドレスが一意性であること
# パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）
# パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）
# 新規登録/本人情報確認
# ユーザー本名は、名字と名前がそれぞれ必須であること
# ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
# ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること
# ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること
# match(/[a-c]/)
# .match(/\d/)
# .match(/a-z\d/)
# /\A[ぁ-んァ-ヶー－]+\z/

