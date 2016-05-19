class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :notifications, dependent: :destroy

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :body, presence: true

  def self.search(search)
    where("body LIKE ?", "%#{search}%")
  end

  # calculate number of likes
  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end

  def trunc
    self.body.truncate(250)
  end

end
