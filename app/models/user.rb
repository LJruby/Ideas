class User < ActiveRecord::Base
	before_create :email_down
	has_secure_password
  validates :name, :role_id, presence: true
  validates :email, presence: true, format: /@/, uniqueness: true
  has_many :ideas
  has_many :votes
  belongs_to :role
  
  def email_down
		self.email.downcase!
	end
end
