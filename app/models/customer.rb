class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, format: /@/, uniqueness: true
  has_many :ideas
end
