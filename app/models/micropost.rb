class Micropost < ActiveRecord::Base
 belongs_to :user
 default_scope -> { order(created_at: :desc) }
 validates :user_id, presence: true
 validates :content, presence: true, length: { maximum: 270000 }  # 270000 Max length approx equal to 100 pages of writing, including spaces, for now. 
end
