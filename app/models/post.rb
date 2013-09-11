class Post < ActiveRecord::Base
  validates :title, length: { maximum: 30 }
  attr_accessible :content, :title
end
