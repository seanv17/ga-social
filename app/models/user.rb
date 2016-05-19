class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :notifications, dependent: :destroy

  validates :email,
            uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  before_destroy :destroy_posts


  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  acts_as_messageable

  def destroy_posts
    self.posts.destroy_all
  end

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

end
