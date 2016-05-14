class Post < ActiveRecord::Base
  belongs_to :user

  def self.search(search)
    where("body LIKE ?", "%#{search}%")
  end
end
