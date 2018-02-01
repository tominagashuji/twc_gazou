class User < ApplicationRecord
# 存在性の確認（presence）
	validates :name, presence: true
	validates :email, presence: true

# 長さの確認（presence）、emailの判定
	validates :name,  presence: true, length: { maximum: 30 }
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

# メアドを小文字にして制約をかけている
	before_save { email.downcase! }

# パスワードのハッシュ化（登録フォームの作成）
	has_secure_password

# パスワードのバリデーション（６文字以上を設定）
	validates :password, presence: true, length: { minimum: 6 }

# アソシエーション設定多対多の１側
  has_many :blogs
# アソシエーション設定多対多の多側
	has_many :favorites, dependent: :destroy

# お気に入り一覧表示の定義
	has_many :favorite_blogs, through: :favorites, source: :blog

# carrierwave 設定
	mount_uploader :image, ImageUploader

end
