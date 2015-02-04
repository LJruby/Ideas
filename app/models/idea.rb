class Idea < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :status
end
