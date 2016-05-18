class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :notifications, dependent: :destroy
  has_many :conversations, :foreign_key => :sender_id

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  acts_as_messageable

  def name
    "#{first_name} #{last_name}"
  end

  def mailboxer_email(object)
    nil
  end

  def slug_candidates
    [
      "#{first_name}-#{last_name}"
    ]
  end

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
