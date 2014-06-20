class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies
  default_scope -> { order('reply_at DESC') }
  validates :user_id, presence: true
  validates :name, presence: true, length: {minimum: 10, maximum: 50 }
  validates :content, presence: true, length: {minimum:15 }

  def view
    if self.view_count.nil?
      self.view_count = 1
      self.save
    else
      self.view_count += 1
      self.save
    end
  end
    
  def self.search(search)
    if search
      self.where("name like ?", "%#{search}%")
    else
      self.all
    end
  end
end
