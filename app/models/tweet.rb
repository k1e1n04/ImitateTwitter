class Tweet < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  validates :body, presence: true, length: { maximum: 140 }
end