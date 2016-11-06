class Topic < ActiveRecord::Base
  validates :content, presence: true
end
