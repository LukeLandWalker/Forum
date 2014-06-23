class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, :counter_cache => true
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: {minimum:15 }
end
