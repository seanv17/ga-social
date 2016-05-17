class Comment < ActiveRecord::Base
acts_as_tree order: 'created_at DESC', dependent: :destroy
  belongs_to :user
  belongs_to :post

  has_many :notifications, dependent: :destroy
  belongs_to :post,
        touch: true
end
