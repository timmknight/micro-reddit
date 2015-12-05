class Post < ActiveRecord::Base
	validates :title, presence: true,
										length: { maximum: 500 }
	validates :body, presence: true,
								   length: { maximum: 10000 }
	validates :user_id, presence: true,
											numericality: true
	belongs_to :user
	has_many :comments
end
