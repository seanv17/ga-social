class Notification < ActiveRecord::Base

  validates :user_id, :notified_by_id, :post_id, :notice_type, presence: true
end
