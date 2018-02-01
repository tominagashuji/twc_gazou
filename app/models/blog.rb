class Blog < ApplicationRecord
	validates :content,presence: true
# 「1文字以上」
	validates :content,    length: { minimum: 1 }
# 「140文字以下」
  validates :content,    length: { maximum: 140 }

# アソシエーション設定一対多の多側
  belongs_to :user
# アソシエーション設定多対多の多側
	has_many :favorites, dependent: :destroy
	has_many :favorite_users, through: :favorites, source: :user

# 画像アップロードの設定
	mount_uploader :image, ImageUploader

end
