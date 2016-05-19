class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :notifications, dependent: :destroy

  validates :body, presence: true

  before_destroy :destroy_comments

  def destroy_comments
    self.comments.destroy_all
  end

#the search method is used in posts contreller #index to search for posts
  def self.search(search)
    where("LOWER(body) LIKE ?", "%#{search.downcase}%")
  end

  # calculate number of likes
  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end

  #the trunc method is used in the best_in_place (gem) post body field in the display_as attribute
  def trunc
    self.body.truncate(250)
  end

end
