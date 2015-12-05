class Comment < ActiveRecord::Base
  validates :content, presence: true,
                      length: { maximum: 10000 }
  validates :post_id, presence: true
  belongs_to :user
  belongs_to :post
end
