class Vote < ActiveRecord::Base
  validates :idea_id, :user_id,
		presence: true
  belongs_to :idea
  belongs_to :user
end
