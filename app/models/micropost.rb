class Micropost < ApplicationRecord

  acts_as_votable cacheable_strategy: :update_columns
  has_many :comments
  belongs_to :user
  default_scope -> { order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :picture_size


  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, " less than 5 MB")
    end
  end
end
