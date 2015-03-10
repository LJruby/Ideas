class Idea < ActiveRecord::Base
  validates :title,
    presence: true,
    uniqueness: true
  validates :status_id, :category_id, :user_id,
    presence: true

  belongs_to :status
  belongs_to :user
  belongs_to :category
  has_many :votes
  
  has_attached_file :attachment, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/

end
